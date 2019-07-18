class Admin::BannersController < ApplicationController
  before_action :set_banner

  def change
    @banner.update(banner_params)
    redirect_to products_path
  end

  def change_banner
  end

  def set_banner
    @banner = Banner.any? ? Banner.first : Banner.new
    authorize [:admin, @banner]
  end

  def banner_params
    params.require(:banner).permit(:photo)
  end
end
