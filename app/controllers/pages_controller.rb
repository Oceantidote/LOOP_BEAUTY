class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :homepage]

  def home
  end

  def homepage
  end
end
