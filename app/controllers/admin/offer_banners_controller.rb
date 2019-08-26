class Admin::OfferBannersController < ApplicationController
  before_action :set_offer_banner

  def change
    @offer_banner.update(offer_banner_params)
    redirect_to request.referer
  end

  def change_offer_banner
  end

  def set_offer_banner
    @offer_banner = OfferBanner.any? ? OfferBanner.last : OfferBanner.new
    authorize [:admin, @offer_banner]
  end

  def offer_banner_params
    params.require(:offer_banner).permit(:content)
  end
end
