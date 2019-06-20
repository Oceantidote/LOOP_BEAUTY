class OrdersController < ApplicationController
  def new
    @basket = find_basket
    @order = Order.new
    authorize @order
  end

  def create
    @basket = find_basket
    @order = Order.new
    authorize @order
    @order.user = current_user
    if @order.save
      @basket.basket_products.each do |item|
        order_product = item.convert_to_order_product
        order_product.order = @order
        order_product.user = current_user
        order_product.save
      end
      @basket.empty!
      redirect_to order_path(@order)
    else
      flash[:error] = 'Error!'
      render :new
    end
  end
end
