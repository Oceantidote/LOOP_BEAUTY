class BasketsController < ApplicationController
  skip_before_action :authenticate_user!

  def show
    @basket = find_basket
    authorize @basket
  end

  def add_discount_code
    @basket = find_basket
    authorize @basket
    code = params[:basket][:discount_code]
    discount = DiscountCode.find_by_code(code)
    if discount.present?
      @basket.discount_code = discount
      @basket.save
      respond_to do |format|
        format.js
        format.html do
          flash[:notice] = 'Discount applied'
          redirect_to bag_path
        end
      end
    else
      respond_to do |format|
        format.js
        format.html do
          flash[:notice] = 'Discount not found'
          redirect_to bag_path
        end
      end
    end
  end
end
