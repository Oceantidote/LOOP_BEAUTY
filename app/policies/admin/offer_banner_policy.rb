class Admin::OfferBannerPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def change_offer_banner?
    user.admin?
  end

  def change?
    change_offer_banner?
  end
end
