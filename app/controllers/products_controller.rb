class ProductsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    if params[:query].present?
      @products = policy_scope(Product).where(published: true).global_search(params[:query])
      @original = policy_scope(Product).global_search(params[:query])
    else
      @products = policy_scope(Product).where(published: true)
      @original = policy_scope(Product)
    end
    @products = Product.filter(params[:product].slice(:category, :brand)) if params[:product].present?
    @start = params[:product].nil? || (params[:product][:brand].reject(&:blank?).empty? && params[:product][:category].reject(&:blank?).empty?)
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

  def my_product
    @product = Product.friendly.find(params[:id])
    authorize @product
    @basket = find_basket
    @basket_product = BasketProduct.new(product: @product, basket: @basket, shade: @product.shades.first)
    if @basket.products.any? && @basket.basket_products.where(product: @basket_product.product).where(shade: @basket_product.shade).any? # IFE FIX TO BE APPROVED BY THE MIGHTY BEN WRIGHT
        @old_item = @basket.basket_products.where(shade: @basket_product.shade).first
        @old_item.update(quantity: @old_item.quantity + 1)
    else
      if @basket_product.save
        respond_to do |format|
          format.js
          format.html { redirect_to user_my_products_path(current_user), notice: 'Item added to bag' }
        end
      else
        respond_to do |format|
          format.js
          format.html { redirect_to user_my_products_path(current_user), notice: 'Something went wrong' }
        end
      end
    end
  end

  private

  def sort_params
    params[:product][:sort][:method].split(',')
  end
end
