class ProductsController < ApplicationController
  skip_before_action :authenticate_user!
  skip_before_action :verify_authenticity_token, only: [:show]

  def index
    @query = params[:query]
    if params[:query].present?
      @products = policy_scope(Product).global_search(params[:query])
      @all = @products
      @products = @products.page params[:page]
      @products_count = policy_scope(Product).global_search(params[:query]).count
      @original = policy_scope(Product).global_search(params[:query])
    else
      @products = policy_scope(Product)
      @all = @products
      @products = @products.page params[:page]
      @products_count = policy_scope(Product).count
      @original = policy_scope(Product)
    end
    @products = policy_scope(Product).filter(params[:product].slice(:sub_category, :brand)) if params[:product].present?
    @products = @products.page params[:page]
    @products_count = @products.count
    if params[:product].present? && params[:product][:sort].present?
      @products = @products.filter_sort(*sort_params).page params[:page]
      @products_count = @products.filter_sort(*sort_params).count
      @sort_method = params[:product][:sort][:method]
    else
      @products = @products.filter_sort(*'created_at,desc'.split(',')).page params[:page]
      @products_count = @products.count
      @sort_method = 'created_at,desc'
    end
    @categories = Category.all.map { |category| category.name }
    @brand_names = Brand.all.map { |brand| brand.name }
    respond_to do |format|
      format.html { render 'products/index' }
      format.js
    end
  end

  def search_products
    # if params[:input].present?
      @search_products = policy_scope(Product).global_search(params[:input])
    # else
    #   @search_products = policy_scope(Product)
    # end
    @query = params[:input]
    authorize @search_products
    respond_to do |format|
      format.js
    end
  end

  def show
    @product = Product.friendly.find(params[:id])
    authorize @product
    @customer_reviews = @product.customer_reviews.page params[:page]
    @tutorials = Tutorial.select { |tutorial| tutorial.products.include?(@product) }
    respond_to do |format|
      format.js
      format.html
    end
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
