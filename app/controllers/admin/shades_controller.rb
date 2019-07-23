class Admin::ShadesController < ApplicationController
  before_action :set_shade, only: [:update, :destroy]

  def create
    @product = Product.friendly.find(params[:product_id])
    @shade = Shade.new(shade_params)
    @shade.product = @product
    authorize @shade
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

  private

  def shade_params
    params.require(:shade).permit(:name, :sku, :photos)
  end

  def set_shade
    @shade = Shade.find(params[:id])
    authorize @shade
  end
end
