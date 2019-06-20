class UsersController < ApplicationController
  # FOR INFLUENCERS SHOW PAGE CREATED BY IFE
  skip_before_action :authenticate_user!, only: [:show, :index, :make_up]
  before_action :set_user, only: [:show, :publish, :unpublish, :make_up]
  # FOR INFLUENCERS SHOW PAGE CREATED BY IFE

  def dashboard
    authorize current_user
  end

  def my_orders
    authorize current_user
  end

  def my_products
    authorize current_user
  end

  def refer_a_friend
    authorize current_user
  end

  def wishlist
    authorize current_user
  end

  def account_details
    authorize current_user
  end

  def preference_centre
    authorize current_user
  end

  def analytics
    authorize current_user
  end

  def showroom
    authorize current_user
  end

  def uploads
    @pending = current_user.tutorials.where(status: 'pending').to_a
    @pending + current_user.lookbooks.where(status: 'pending').to_a
    @rejected = current_user.tutorials.where(status: 'rejected').to_a
    @pending + current_user.lookbooks.where(status: 'rejected').to_a
    @approved = current_user.tutorials.where(status: 'approved').to_a
    @pending + current_user.lookbooks.where(status: 'approved').to_a
    authorize current_user
  end

  def dashboard
    authorize current_user
  end

  def share
    authorize current_user
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

  end
  # FOR INFLUENCERS SHOW PAGE CREATED BY IFE

  def q_and_a
    raise
  end

  def set_user
    @user = User.find(User.select { |user| user.slug == params[:id] }.first.id)
    authorize @user
  end


end
