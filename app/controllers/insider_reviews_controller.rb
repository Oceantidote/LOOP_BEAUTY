class InsiderReviewsController < ApplicationController

  def create
    @review = InsiderReview.new(insider_review_params)
    @product = Product.friendly.find(params[:product_id])
    @review.product = @product
    current_user.influencer ? @review.user = current_user : @review.user = User.find(params[:insider_review][:user_id])
    authorize @review
    if @review.save!
      redirect_to product_path(@product), notice: 'Review saved'
      flash[:alert] = "Thank you for leaving a review."
    else
      redirect_to product_path(@product), notice: 'Something went wrong'
    end
  end

  private

  def insider_review_params
    params.require(:insider_review).permit(:rating, :review)
  end
end
