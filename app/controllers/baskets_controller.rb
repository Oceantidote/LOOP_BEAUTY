class BasketsController < ApplicationController
  skip_before_action :authenticate_user!

  def show
    @basket = find_basket
    authorize @basket
  end

  def add_discount_code
    @basket = find_basket
    authorize @basket
    @code = params[:basket][:discount_code]
    @discount = DiscountCode.find_by_code(@code)
    @basket.discount_code = @discount if @discount.present?
    if @discount.present? && @basket.save
      respond_to do |format|
        format.html do
          flash[:notice] = 'Discount applied'
          redirect_to bag_path
        end
        format.js
      end
    else
      respond_to do |format|
        format.html do
          flash[:notice] = 'Discount not found'
          redirect_to bag_path
        end
        format.js
      end
    end
  end

  def remove_discount_code
    @basket = find_basket
    authorize @basket
    @basket.update(discount_code: nil)
    respond_to do |format|
      format.html { redirect_to bag_path, notice: "Discount code removed" }
      format.js
    end
  end
end
