class BasketProductsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_basket_product, only: [:update, :destroy]

  def create
    @product = Product.friendly.find(params[:product_id])
    @item = BasketProduct.new(basket_product_params)
    @item.basket = find_basket
    @item.product = @product
    @item.shade = @product.shades.first if @item.shade.nil?
    authorize @item
    if @item.save
      flash[:notice] = 'Item added to bag'
    else
      flash[:error] = 'Item not added due to error'
    end
      redirect_to product_path(@product)
  end

  def update
    unless @item.update(basket_product_params)
      flash[:error] = "Whoops! Something went wrong"
    end
    if @item.quantity < 1
      destroy
    else
      redirect_to bag_path
    end
  end

  def destroy
    @item.destroy
    redirect_to bag_path
  end

  private

  def basket_product_params
    params.require(:basket_product).permit(:quantity, :shade_id)
  end

  def set_basket_product
    @item = BasketProduct.find(params[:id])
    authorize @item
  end
end
