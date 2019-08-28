class ShowroomProductsController < ApplicationController
  before_action :set_user, only: [:create, :destroy]
  def create
    # @showroom_product = ShowroomProduct.new(showroom_product_params)
    @showroom_product = ShowroomProduct.new(showroom: @user.showroom, product: Product.find(params[:showroom_product][:product]))
    @showroom_product.showroom = @user.showroom
    authorize @showroom_product
    if @showroom_product.save
      redirect_to make_up_user_path(@user)
    end
  end

  def destroy
    @showroom_product = ShowroomProduct.find(params[:id])
    authorize @showroom_product
    @showroom_product.destroy
    redirect_to make_up_user_path(@user)
  end

  private

  def set_user
    @user = User.friendly.find(params[:user_id])
  end

  def showroom_product_params
    params.require(:showroom_product).permit(:product)
  end
end
