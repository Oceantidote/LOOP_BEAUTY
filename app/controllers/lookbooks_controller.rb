class LookbooksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index, :add_to_bag]
  before_action :set_lookbook, only: [:edit, :update, :destroy]

  def index
    @user = User.friendly.find(params[:user_id])
    @lookbooks = policy_scope(Lookbook).where(user: @user).where(status: 'approved')
    @sort_method = params[:sort].present? ? params[:sort][:sort_method] : 'created_at,desc'
    @lookbooks = @lookbooks.filter_sort(*@sort_method.split(','))
  end

  def show
    # NOT SURE IF CORRECT BUT WORKS
    # user = User.find(params[:user_id])
    @lookbook = Lookbook.find((Lookbook.select{ |r| r.slug == params[:id]}).first.id)
    @lookbooks = Lookbook.where(user: @lookbook.user)
    @all_lookbooks = Lookbook.where(status: 'approved')
    authorize @lookbook
    current_lookbook = @lookbooks.index(@lookbook)
    @previous_lookbook = @lookbooks[@lookbook == @lookbooks.first ? @lookbooks.index(@lookbooks.last) : current_lookbook - 1]
    @next_lookbook = @lookbooks[@lookbook == @lookbooks.last ? @lookbooks.index(@lookbooks.first) : current_lookbook + 1]
    @users_lookbooks = Lookbook.where(user: @lookbook.user).where(status: 'approved').where.not(id: @lookbook.id)
  end

  def new
    @lookbook = Lookbook.new
    @user = current_user
    authorize @lookbook
  end

  def create
    @lookbook = Lookbook.new(lookbook_params)
    @lookbook.user = current_user
    authorize @lookbook
    if @lookbook.save
      flash[:notice] = 'Lookbook pending approval'
      redirect_to lookbook_path(@lookbook)
    else
      raise
      flash[:error] = 'Please review problems'
      render :new
    end
  end

  def edit
    @user = @lookbook.user
  end

  def update
    if @lookbook.update(lookbook_params)
      flash[:notice] = 'Lookbook updated'
      redirect_to lookbook_path(@lookbook)
    else
      flash[:error] = 'Please review problems'
      render :edit
    end
  end

  def destroy
    if @lookbook.destroy
      flash[:notice] = 'Lookbook deleted'
      redirect_to root_path
    end
  end

  def approve
    @lookbook.approve!
    redirect_to admin_lookbooks_path
  end

  def reject
    @lookbook.update(lookbook_params)
    @lookbook.reject!
    redirect_to admin_lookbooks_path
  end

  def add_to_bag
    @lookbook = Lookbook.friendly.find(params[:id])
    authorize @lookbook
    @basket = find_basket
    @lookbook.products.each do |product|
      @item = BasketProduct.new(product: product, basket: @basket, shade: product.shades.first)
      if @basket.products.any? && @basket.basket_products.where(product: @item.product).where(shade: @item.shade).any? # IFE FIX TO BE APPROVED BY THE MIGHTY BEN WRIGHT
      # if @basket.shades.include?(@item.shade)
        @old_item = @basket.basket_products.where(shade: @item.shade).first
        @old_item.update(quantity: @old_item.quantity + 1)
        # flash[:notice] = 'Item added to bag'
      elsif @item.save
        # flash[:notice] = 'Item added to bag'
      end
    end
    respond_to do |format|
      format.js
      format.html do
        flash[:notice] = 'Products added to bag'
        redirect_to products_path
      end
    end
  end

  private

  def set_lookbook
    # @lookbook = Lookbook.friendly.find(params[:id])

    # NOT SURE IF CORRECT BUT WORKS
    user = User.select { |u| u.slug == params[:id] }.first
    # @lookbook = Lookbook.find(user.id)
    @lookbook = Lookbook.friendly.find(params[:id])
    authorize @lookbook
  end

  def lookbook_params
    params.require(:lookbook).permit(:title, :photo, :rejection_message, :description, product_ids: [])
  end
end
