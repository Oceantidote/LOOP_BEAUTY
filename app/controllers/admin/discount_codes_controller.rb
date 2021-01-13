class Admin::DiscountCodesController < ApplicationController
  before_action :set_discount, only: [:edit, :update, :destroy, :deactivate]

  def index
    @codes = policy_scope([:admin, DiscountCode])
  end

  def new
    @code = DiscountCode.new
    authorize [:admin, @code]
  end

  def create
    @code = DiscountCode.new(discount_params)
    authorize [:admin, @code]
    if @code.save
      redirect_to admin_discount_codes_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    authorize [:admin, @code]
    if @code.update(discount_params)
      redirect_to admin_discount_codes_path
    else
      render :edit
    end
  end

  def destroy
    authorize [:admin, @code]
    @code.destroy
    redirect_to admin_discount_codes_path
  end

  def deactivate
    authorize [:admin, @code]
    @code.update(active: false)
    redirect_to admin_discount_codes_path
  end

  private

  def discount_params
    params.require(:discount_code).permit(:code, :discount, :uses, :user_uses)
  end

  def set_discount
    @code = DiscountCode.find(params[:id])
  end
end
