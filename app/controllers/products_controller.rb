class ProductsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @products = policy_scope(Product)
    @products = Product.filter(params[:product].slice(:category, :brand)) if params[:product].present?
    if params[:product].present? && params[:product][:sort].present?
      @products = @products.filter_sort(*sort_params)
      @sort_method = params[:product][:sort][:method]
    else
      @products = @products.filter_sort(*'created_at,desc'.split(','))
      @sort_method = 'created_at,desc'
    end
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

  def sort_params
    params[:product][:sort][:method].split(',')
  end

end
