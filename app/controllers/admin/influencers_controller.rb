class Admin::InfluencersController < ApplicationController
  before_action :set_influencer, only: [:edit, :update, :publish, :unpublish]

  def new
    @influencer = User.new(influencer: true)
    authorize [:admin, @influencer]
  end

  def create
    @influencer = User.new(influencer_params)
    @influencer.influencer = true
    @influencer.accepts_terms = true
    if @influencer.save
      flash[:notice] = 'Influencer created'
      redirect_to user_path(@influencer)
    else
      flash[:error] = 'Please fix errors'
      render :new
    end
  end

  def edit

  end

  def update
    new_params = influencer_params
    new_params.delete(:password) if influencer_params[:password].blank?
    if @influencer.update(new_params)
      flash[:notice] = 'Influencer Updated'
      redirect_to user_path(@influencer)
    else
      flash[:error] = 'Please review the problems'
      render :edit
    end
  end

  def publish
    @influencer.published = true
    @influencer.save!
    flash[:notice] = 'User Published!'
    redirect_to user_path(@influencer)
  end

  def unpublish
    @influencer.published = false
    @influencer.save!
    flash[:notice] = 'User unpublished!'
    redirect_to user_path(@influencer)
  end

  private

  def set_influencer
    @influencer = User.friendly.find(params[:id])
    authorize [:admin, @influencer]
  end

  def influencer_params
    params.require(:user).permit(:first_name, :light_text, :last_name, :email, :instagram, :youtube, :password, :lookbook_photo, :tutorial_photo, :avatar_photo, :cover_photo, :mobile_cover_photo, :qa_photo, :makeup_photo, :description, :instagram_followers, :youtube_subscribers, :makeup_cover_photo)
  end
end
