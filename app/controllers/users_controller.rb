class UsersController < ApplicationController
  # FOR INFLUENCERS SHOW PAGE CREATED BY IFE
  skip_before_action :authenticate_user!, only: [:show]
  # FOR INFLUENCERS SHOW PAGE CREATED BY IFE

  def dashboard
    authorize current_user
  end

  # FOR INFLUENCERS SHOW PAGE CREATED BY IFE
  def show
    @user = User.find(User.select { |user| user.slug == params[:id] }.first.id)
    authorize @user
  end
  # FOR INFLUENCERS SHOW PAGE CREATED BY IFE

end
