class Admin::InsiderReviewsController < ApplicationController
  before_action :set_product
  def index
    @insider_reviews = policy_scope([:admin, InsiderReview]).where(product: @product)
  end

  def destroy
    @insider_review = InsiderReview.find(params[:id])
    @insider_review.destroy
    redirect_to admin_product_insider_reviews_path
  end

  private

  def set_product
    @product = Product.friendly.find(params[:product_id])
  end
end
