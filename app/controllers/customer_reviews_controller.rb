class CustomerReviewsController < ApplicationController

  def create
    @review = CustomerReview.new(customer_review_params)
    @product = Product.friendly.find(params[:product_id])
    @review.product = @product
    @review.user = current_user
    authorize @review
    if @review.save
      redirect_to product_path(@product), notice: 'Review saved'
      flash[:alert] = "Thankyou for leaving a review."
    else
      redirect_to product_path(@product), notice: 'Something went wrong'
    end
  end

  private

  def customer_review_params
    params.require(:customer_review).permit(:rating, :review, :recommendation)
  end
end
