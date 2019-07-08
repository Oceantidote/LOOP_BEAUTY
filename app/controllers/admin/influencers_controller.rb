class Admin::InfluencersController < ApplicationController
  before_action :set_influencer, only: [:edit, :update]

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
    if @influencer.update(influencer_params)
      flash[:notice] = 'Influencer Updated'
      redirect_to user_path(@influencer)
    else
      flash[:error] = 'Please review the problems'
      render :edit
    end
  end

  private

  def set_influencer
    @influencer = User.friendly.find(params[:id])
    authorize [:admin, @influencer]
  end

  def influencer_params
    params.require(:user).permit(:first_name, :last_name, :email, :instagram, :youtube, :password, :lookbook_photo, :tutorial_photo, :avatar_photo, :cover_photo, :qa_photo, :description)
  end
end
