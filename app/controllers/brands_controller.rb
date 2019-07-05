class BrandsController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    @brands = policy_scope(Brand)
    @brands_index = ('A'..'Z').to_a
  end

  def show
    @brand = Brand.friendly.find(params[:id])
    authorize @brand
    @products = @brand.products
    @products = @products.filter(params[:product].slice(:category, :brand)) if params[:product].present?
    respond_to do |format|
      format.html { render 'brands/show' }
      format.js
    end
  end
end
