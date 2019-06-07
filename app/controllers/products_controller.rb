class ProductsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @products = policy_scope(Product)
    @products = Product.filter(params.slice(:category, :brand ))
    @categories = Category.all.map { |category| category.name }
    @brand_names = Brand.all.map { |brand| brand.name }
    respond_to do |format|
      format.html { render 'products/index' }
      format.js
    end
  end

  def show
    @product = Product.friendly.find(params[:id])
    authorize @product
  end

  private



end
