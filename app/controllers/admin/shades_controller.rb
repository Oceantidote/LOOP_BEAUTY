class Admin::ShadesController < ApplicationController
  before_action :set_shade, only: [:update, :destroy]

  def index
    @shades = policy_scope(Shade)
  end

  def create
    @product = Product.friendly.find(params[:product_id])
    @shade = Shade.new(shade_params)
    @shade.product = @product
    authorize [:admin, @shade]
    if @shade.save
      redirect_to edit_admin_product_path(@product), notice: 'Shade added'
    else
      render template: 'admin/product/edit'
      flash[:error] = 'Not all fields complete'
    end
  end

  def update
    @product = @shade.product
    if @shade.update(shade_params)
      redirect_to edit_admin_product_path(@product), notice: 'Shade added'
    else
      render template: 'admin/product/edit'
      flash[:error] = 'Not all fields complete'
    end
  end

  def destroy
    @shade.destroy
    redirect_to edit_admin_product_path(@shade.product)
  end

  def destroy_photo
    @photo = ActiveStorage::Attachment.find(params[:id])
    authorize [:admin, @photo.record_type.constantize.find(@photo.record_id)]
    @photo.purge
    respond_to do |format|
      format.html { redirect_back fallback_location: request.referer }
      format.js
    end
  end

  private

  def shade_params
    params.require(:shade).permit(:name, :sku, :card_photo, :shade_color, photos: [])
  end

  def set_shade
    @shade = Shade.find(params[:id])
    authorize [:admin, @shade]
  end
end
