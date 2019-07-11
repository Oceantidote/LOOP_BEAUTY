class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index, :make_up]
  before_action :set_nested_user, only: [:uploads, :share, :dashboard, :my_orders, :my_products, :refer_a_friend, :wishlist, :account_details, :preference_centre, :analytics, :showroom]
  before_action :set_user, only: [:show, :make_up, :q_and_a]
  before_action :set_wishlist, only: [:wishlist, :my_products]

  def dashboard
  end

  def my_orders
  end

  def my_products
  end

  def refer_a_friend
  end

  def wishlist
  end

  def account_details
    @delivery_address = Address.new(delivery_address: true)
    @billing_address = Address.new(delivery_address: false)
  end

  def preference_centre
  end

  def analytics
  end

  def showroom
    @products = Product.where(demoable: true)
  end

  def uploads
    @pending = current_user.tutorials.where(status: 'pending').to_a
    @pending + current_user.lookbooks.where(status: 'pending').to_a
    @rejected = current_user.tutorials.where(status: 'rejected').to_a
    @pending + current_user.lookbooks.where(status: 'rejected').to_a
    @approved = current_user.tutorials.where(status: 'approved').to_a
    @pending + current_user.lookbooks.where(status: 'approved').to_a
  end

  def update
    authorize current_user
    if current_user.update(user_params)
      redirect_to user_account_details_path(current_user)
    else
      render :account_details
    end
  end

  def change_password
    authorize current_user
    if current_user.valid_password?(password_params[:old_password])
      if password_params[:password] == password_params[:password_confirmation]
        current_user.update(password: password_params[:password])
        bypass_sign_in current_user
        redirect_to user_account_details_path(current_user)
        flash[:notice] = 'Password changed'
      else
        flash[:error] = 'Passwords do not match'
        render :account_details
      end
    else
      flash[:error] = 'Password was incorrect'
      render :account_details
    end
  end

  def dashboard
  end

  def share
  end

  # FOR INFLUENCERS SHOW PAGE CREATED BY IFE
  def show
  end

  def index
    @users = policy_scope(User)
  end

  def make_up
    @products = @user.showroom.showroom_products.map{ |r| r.product }
    @products = Product.filter(params[:product].slice(:category, :brand)) if params[:product].present?
    if params[:product].present? && params[:product][:sort].present?
      @products = @products.filter_sort(*sort_params)
      @sort_method = params[:product][:sort][:method]
    else
      # @products = @products.filter_sort(*'created_at,desc'.split(','))
      @sort_method = 'created_at,desc'
    end
  end
  # FOR INFLUENCERS SHOW PAGE CREATED BY IFE

  def q_and_a
  end

  def set_user
    @user = User.friendly.find(params[:id])
    authorize @user
  end

  def set_wishlist
    # WISHLIST TEST
    @wishlist = Wishlist.find_by(user: @user)
    # WISHLIST TEST
  end

  def set_nested_user
    if params[:user_id]
      @user = User.friendly.find(params[:user_id])
    else
      @user = User.friendly.find(params[:id])
    end
    authorize @user
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :dob)
  end

  def password_params
    params.require(:user).permit(:password, :password_confirmation, :old_password)
  end
end
