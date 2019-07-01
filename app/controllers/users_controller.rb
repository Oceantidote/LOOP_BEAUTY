class UsersController < ApplicationController
  # FOR INFLUENCERS SHOW PAGE CREATED BY IFE
  skip_before_action :authenticate_user!, only: [:show, :index, :make_up]
  before_action :set_nested_user, only: [:uploads, :share, :dashboard, :my_orders, :my_products, :refer_a_friend, :wishlist, :account_details, :preference_centre, :analytics, :showroom]
  before_action :set_user, only: [:show, :make_up, :q_and_a]
  # FOR INFLUENCERS SHOW PAGE CREATED BY IFE

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
  end

  def preference_centre
  end

  def analytics
  end

  def showroom
  end

  def uploads
    @pending = current_user.tutorials.where(status: 'pending').to_a
    @pending + current_user.lookbooks.where(status: 'pending').to_a
    @rejected = current_user.tutorials.where(status: 'rejected').to_a
    @pending + current_user.lookbooks.where(status: 'rejected').to_a
    @approved = current_user.tutorials.where(status: 'approved').to_a
    @pending + current_user.lookbooks.where(status: 'approved').to_a
  end

  def dashboard
  end

  def share
  end

  # FOR INFLUENCERS SHOW PAGE CREATED BY IFE
  def show
    @user = User.find(User.select { |user| user.slug == params[:id] }.first.id)
    authorize @user
  end

  def index
    @users = policy_scope(User)
  end

  def publish
    @user.published = true
    @user.save!
    flash[:notice] = 'User Published!'
    redirect_to user_path(@user)
  end

  def unpublish
    @user.published = false
    @user.save!
    flash[:notice] = 'User unpublished!'
    redirect_to user_path(@user)
  end

  def make_up
    @products = @user.showroom.showroom_products.map{|r| r.product}
  end
  # FOR INFLUENCERS SHOW PAGE CREATED BY IFE

  def q_and_a
  end

  def set_user
    @user = User.find(User.select { |user| user.slug == params[:id] }.first.id)
    authorize @user
  end

  def set_nested_user
    if current_user.influencer?
      @user = User.find(User.select { |user| user.slug == params[:user_id] }.first.id)
    else
      @user = User.find(User.select { |user| user.slug == params[:id] }.first.id)
    end
    authorize @user
  end


end
