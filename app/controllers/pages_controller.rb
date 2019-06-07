class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :homepage, :terms_and_conditions, :shipping, :sale_terms, :privacy_policy]

  def home
  end

  def homepage
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
