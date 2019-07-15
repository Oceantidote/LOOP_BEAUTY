class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :homepage, :freebies, :insider, :videos, :influencer_video, :about_us, :questions_and_answers, :influencers, :terms_and_conditions, :shipping, :sale_terms, :privacy_policy, :contact_us]

  def home
  end

  def homepage
    @tutorials = Tutorial.all.order(created_at: :DESC).first(4)
    @insider_articles = InsiderArticle.all.order(created_at: :DESC).first(3)
  end

  def freebies
  end

  def insider
  end

  def videos
    @tutorials = Tutorial.all
  end

  def influencer_video
  end

  def about_us
  end

  def frequently_asked_questions
  end

  def careers
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

  def contact_us
    if params[:send_email]
      ContactMailer.with(details: params[:send_email]).contact.deliver_now
    end
  end
end
