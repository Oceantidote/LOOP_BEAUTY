class CustomerReviewsController < ApplicationController

  def create
    @review = CustomerReview.new(customer_review_params)
    @product = Product.friendly.find(params[:product_id])
    @review.product = @product
    @review.user = current_user
    authorize @review
    if @review.save
      redirect_to product_path(@product), alert: 'Review saved'
      flash[:alert] = "Thank you for leaving a review."
    else
      redirect_to product_path(@product), alert: 'Something went wrong'
    end
  end

  private

  def customer_review_params
    params.require(:customer_review).permit(:rating, :title, :review, :recommendation)
  end
end
