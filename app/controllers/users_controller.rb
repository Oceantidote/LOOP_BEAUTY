class UsersController < ApplicationController
  # FOR INFLUENCERS SHOW PAGE CREATED BY IFE
  skip_before_action :authenticate_user!, only: [:show, :index, :make_up]
  before_action :set_user, only: [:show, :publish, :unpublish, :make_up]
  # FOR INFLUENCERS SHOW PAGE CREATED BY IFE

  def dashboard
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
