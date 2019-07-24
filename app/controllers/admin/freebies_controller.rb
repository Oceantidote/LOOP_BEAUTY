class Admin::FreebiesController < ApplicationController
  before_action :set_freebies, only: [:edit, :update, :destroy]

  def index
    @freebies = policy_scope([:admin, Freebie])
  end

  def new
    @freebie = Freebie.new(discount_code: DiscountCode.new)
    authorize [:admin, @freebie]
  end

  def create
    @freebie = Freebie.new(freebie_params)
    authorize [:admin, @freebie]
    @discount = DiscountCode.new(discount_params)
    @freebie.discount_code = @discount
    if @freebie.valid? && @discount.valid?
      @discount.save
      @freebie.save
      redirect_to admin_freebies_path
    else
      render :new
      flash[:error] = 'Fix errors'
    end
  end

  def edit
  end

  def update
    @freebie.assign_attributes(freebie_params)
    @freebie.discount_code.assign_attributes(discount_params)
    if @freebie.valid? && @freebie.discount_code.valid?
      @freebie.discount_code.save
      @freebie.save
      redirect_to admin_freebies_path
    else
      render :edit
      flash[:error] = 'Fix errors'
    end
  end

  def destroy
    @freebie.destroy
    redirect_to admin_freebies_path
  end

  private

  def freebie_params
    params.require(:freebie).permit(:blurb, :heading, :banner, :display)
  end

  def discount_params
    params.require(:discount_code).permit(:discount, :code, :uses, :user_uses)
  end

  def set_freebies
    @freebie = Freebie.find(params[:id])
    authorize [:admin, @freebie]
  end
end
