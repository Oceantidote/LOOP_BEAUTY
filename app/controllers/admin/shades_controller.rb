require 'csv'

class Admin::ShadesController < ApplicationController
  before_action :set_shade, only: [:update, :destroy]
  after_action :verify_policy_scoped, only: [:download]
  skip_after_action :verify_authorized, only: [:download]

  def index
    @shades = policy_scope(Shade).page params[:page]
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

  def download
    @shades = policy_scope(Shade).includes(product: [:brand])
    download = CSV.generate(headers: true) do |csv|
      csv << [:brand, :product, :shade, :sku]
      @shades.each do |shade|
        csv << [shade.product.brand.name, shade.product.title, shade.name, shade.sku]
      end
    end
    respond_to do |format|
      format.csv { send_data download, filename: "#{Date.today.strftime('%Y%m%d')}-skus.csv" }
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
