class Admin::InsiderReviewsController < ApplicationController
  before_action :set_product
  def index
    @insider_reviews = policy_scope([:admin, InsiderReview]).where(product: @product)
  end

  def edit
    @insider_reviews = policy_scope([:admin, InsiderReview]).where(product: @product)
    @insider_review = InsiderReview.find(params[:id])
  end

  def update
    @insider_review = InsiderReview.find(params[:id])
    @insider_review.user = User.find(params[:insider_review][:user_id])
    if @insider_review.update(insider_review_params)
      redirect_to admin_product_insider_reviews_path
    else
      render :edit
    end
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

  def insider_review_params
    params.require(:insider_review).permit(:rating, :review)
  end
end
