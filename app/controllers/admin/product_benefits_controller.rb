class Admin::ProductBenefitsController < ApplicationController
  def create
    @product = Product.friendly.find(params[:product_id])
    @product_benefit = ProductBenefit.new(product_benefit_params)
    authorize @product_benefit
    @product_benefit.product = @product
    @product_benefit.save
    redirect_to edit_admin_product_path(@product)
  end

  def destroy
    @product_benefit = ProductBenefit.find(params[:id])
    @product_benefit.destroy
    redirect_to edit_admin_product_path(@product_benefit.product)
  end

  private

  def product_benefit_params
    params.require(:product_benefit).permit(:benefit_id)
  end
end
