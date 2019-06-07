class ProductsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @products = policy_scope(Product)
    @products = Product.filter(params.slice(:category, :brand ))
    @categories = Category.all.map { |category| category.name }
    @brands = Brand.all.map { |brand| brand.name }
  end

  def show
    @product = Product.friendly.find(params[:id])
    authorize @product
  end

  private

end
