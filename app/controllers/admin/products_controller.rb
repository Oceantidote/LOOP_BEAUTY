class Admin::ProductsController < ApplicationController
  before_action :set_product, only: [:edit, :update, :destroy]

  def index
    @products = policy_scope(Product)
  end

  def new
    @product = Product.new
    authorize @product
  end

  def create
    @product = Product.new(product_params)
    authorize @product
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
      redirect_to edit_admin_product_path(@product), notice: "Product added"
    else
      flash[:error] = "Fix errors"
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to admin_products_path, notice: 'Deleted'
  end

  private

  def product_params
    params.require(:product).permit(:weight, :measurement, :title, :details, :lb_id, :category_id, :sub_category_id, :brand_id, :department_id, :price)
  end

  def set_product
    @product = Product.friendly.find(params[:id])
    authorize [:admin, @product]
  end
end