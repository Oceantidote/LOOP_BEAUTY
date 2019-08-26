class Admin::CustomerReviewsController < ApplicationController
  before_action :set_product
  def index
    @customer_reviews = policy_scope([:admin, CustomerReview]).where(product: @product)
  end

  def destroy
    @customer_review = CustomerReview.find(params[:id])
    @customer_review.destroy
    redirect_to admin_product_customer_reviews_path
  end

  private

  def set_product
    @product = Product.friendly.find(params[:product_id])
  end
end
