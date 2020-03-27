class Admin::ProductsController < ApplicationController
  before_action :set_product, only: [:edit, :update, :destroy]

  def index
    @products = policy_scope(Product)
    @all = @products
    @products = @products.page params[:page]
    @products = @products.filter(params[:filter].slice(:brand, :sub_category)).page params[:page] if params[:filter].present?
    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
    @product = Product.new
    authorize [:admin, @product]
  end

  def create
    @product = Product.new(product_params)
    @product.category = @product.sub_category.category
    authorize [:admin, @product]
    if @product.save
      redirect_to edit_admin_product_path(@product), notice: "Product added"
    else
      flash[:error] = "Fix errors"
      render :new
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to product_path(@product), notice: "Product updated"
    else
      flash[:error] = "Fix errors"
      render :edit
    end
  end

  def new_in
    @featured_products = Product.where(featured: true)
    @not_featured_products = Product.where(featured: false).select { |product| !product.out_of_stock? }
  end

  def add_new_in
    product_ids = params[:new_in][:products].reject(&:blank?)
    product_ids.each do |id|
      Product.find(id.to_i).update(featured: true)
    end
    redirect_to admin_new_in_path
  end

  def remove_new_in
    @product = Product.friendly.find(params[:product_id])
    @product.update(featured: false)
    redirect_to admin_new_in_path
  end

  def destroy
    @product.destroy
    redirect_to admin_products_path, notice: 'Deleted'
  end

  private

  def product_params
    params.require(:product).permit(:weight, :measurement, :title, :details, :lb_id, :category_id, :sub_category_id, :brand_id, :department_id, :price, :demoable, :published, product_ids: [])
  end

  def set_product
    @product = Product.friendly.find(params[:id])
    authorize [:admin, @product]
  end
end
