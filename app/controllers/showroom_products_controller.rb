class ShowroomProductsController < ApplicationController
  before_action :set_user, only: [:create, :destroy]
  def create
    # @showroom_product = ShowroomProduct.new(showroom_product_params)
    @showroom_product = ShowroomProduct.new(showroom: @user.showroom, product: Product.find(params[:showroom_product][:product]))
    @showroom_product.showroom = @user.showroom
    authorize @showroom_product
    if @showroom_product.save
      set_variables
      respond_to do |format|
        format.html { redirect_to make_up_user_path(@user) }
        format.js
      end
    end
  end

  def destroy
    @showroom_product = ShowroomProduct.find(params[:id])
    authorize @showroom_product
    @showroom_product.destroy
    set_variables
    respond_to do |format|
      format.html { redirect_to make_up_user_path(@user) }
      format.js
    end
  end

  private

  def set_variables
    @showroom_products = @user.showroom.showroom_products
    @products = @user.showroom.products
    @original = @user.showroom.products
    @demoable_products = Product.all - @products
    @start = params[:product].nil? || (params[:product][:brand].reject(&:blank?).empty? && params[:product][:category].reject(&:blank?).empty?)
    @products = Product.filter(params[:product].slice(:category, :brand)) if params[:product].present?
    if params[:product].present? && params[:product][:sort].present?
      @products = @products.filter_sort(*sort_params)
      @sort_method = params[:product][:sort][:method]
    else
      # @products = @products.filter_sort(*'created_at,desc'.split(','))
      @sort_method = 'created_at,desc'
    end
  end

  def set_user
    @user = User.friendly.find(params[:user_id])
  end

  def showroom_product_params
    params.require(:showroom_product).permit(:product)
  end
end
