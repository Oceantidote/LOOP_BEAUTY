class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :homepage, :freebies, :about_us, :questions_and_answers, :influencers, :terms_and_conditions, :shipping, :sale_terms, :privacy_policy]

  def home
  end

  def homepage
  end

  def freebies
  end

  def about_us
  end

  def questions_and_answers
  end

  def influencers
    @influencers = User.where(influencer: true)
  end

  def terms_and_conditions
  end

  def privacy_policy
  end

  def sale_terms
  end

  def shipping
  end

  def cookies_policy
  end

  def returns_policy
  end
end
