class Admin::InfluencersController < ApplicationController
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
      redirect_to user_showroom_path(@influencer)
    else
      flash[:error] = 'Please fix errors'
      render :new
    end
  end

  def edit
  end

  private

  def influencer_params
    params.require(:user).permit(:first_name, :last_name, :email, :instagram, :youtube, :password, :lookbook_photo, :tutorial_photo, :avatar_photo, :cover_photo, :qa_photo, :description)
  end
end
