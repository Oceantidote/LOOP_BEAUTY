class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :homepage, :freebies, :insider, :videos, :influencer_video, :about_us, :questions_and_answers, :influencers, :terms_and_conditions, :shipping, :sale_terms, :privacy_policy, :contact_us, :returns_policy, :seen_cookie_message, :change_locale]

  def seen_cookie_message
    cookies.permanent[:seen_cookie_message] = true
  end

  def home
  end

  def homepage
    @color = "green"
    @breaks = HomeBanner::UNIQUE_VIEWPORTS.to_a.reverse
    @home_banners = HomeBanner.where(display: true)
    @tutorials = Tutorial.where(status: 'approved').order(created_at: :DESC).first(4)
    @insider_articles = InsiderArticle.where(homepage: true).order(created_at: :DESC).first(3)
    if @locale == 'US'
      @new_in = Product.where(featured: true).where.not(us_price_cents: 0).select { |product| !product.us_out_of_stock? }
      @trending = Product.where.not(us_price_cents: 0).select { |product| !product.us_out_of_stock? }.select { |product| product.brand.name == "Black Up" }
      @best_sellers = Product.where.not(us_price_cents: 0).select { |product| !product.us_out_of_stock? }.last(5)
    else
      @new_in = Product.where(featured: true).where.not(price_cents: 0).select { |product| !product.out_of_stock? }
      @trending = Product.where.not(price_cents: 0).select { |product| !product.out_of_stock? }.select { |product| product.brand.name == "Black Up" }
      @best_sellers = Product.where.not(us_price_cents: 0).select { |product| !product.out_of_stock? }.last(5)
    end
  end

  def freebies
  end

  def insider
  end

  def videos
    @tutorials = Tutorial.where(status: 'approved').order(created_at: :DESC)
    @featured_tutorial = Tutorial.where(featured: true).first
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

  def change_locale
    session['location'] = params['locale']
    redirect_back fallback_location: root_path
  end

  private

  def ordered_array_with_image_urls
    @home_banners.map{|banner| [ banner.id, banner.ordered_array_with_image_paths.map{|ar| ar << url_for(ar[1])} ] }
  end
























end
