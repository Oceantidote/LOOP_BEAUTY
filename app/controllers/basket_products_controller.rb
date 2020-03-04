class BasketProductsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_basket_product, only: [:update, :destroy, :set_credit_purchase]

  def create
    @product = Product.friendly.find(params[:product_id])
    @item = BasketProduct.new(basket_product_params)
    @item.basket = find_basket
    @item.product = @product
    @item.shade = @product.shades.first if @item.shade.nil?
    if current_user&.influencer && current_user&.remaining_credit_cents > 0 && @product.demoable
      @item.purchase_with_credit = true
    end
    authorize @item
    if @basket.products.any? && @basket.basket_products.where(product: @item.product).where(shade: @item.shade).any? # IFE FIX TO BE APPROVED BY THE MIGHTY BEN WRIGHT
    # if @basket.shades.include?(@item.shade)
      @old_item = @basket.basket_products.where(shade: @item.shade).first
      @old_item.update(quantity: @old_item.quantity + 1)
      # flash[:notice] = 'Item added to bag'
    elsif @item.save
      # flash[:notice] = 'Item added to bag'
    else
      flash[:error] = 'Item not added due to error'
    end
    respond_to do |format|
      format.html { redirect_to product_path(@product) }
      format.js
    end
    # redirect_to product_path(@product)
  end

  def update
    unless @item.update(basket_product_params)
      flash[:error] = "Whoops! Something went wrong"
    end
    if @item.quantity < 1
      destroy
    else
      respond_to do |format|
        format.html { redirect_to bag_path }
        format.js
      end
    end
  end

  def destroy
    @item.destroy
   respond_to do |format|
      format.html { redirect_to bag_path }
      format.js
    end
  end

  def set_credit_purchase
    @item.update(purchase_with_credit: params[:basket_product][:purchase_with_credit])
    respond_to do |format|
      format.js { render :update }
      format.html { redirect_to bag_path }
    end
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
