class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :homepage]

  def home
  end

  def homepage
    @brands = Brand.all.order(name: :asc)
    @influencers = User.where(influencer: true).order(first_name: :asc)
  end
end
