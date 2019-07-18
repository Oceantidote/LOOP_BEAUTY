class Admin::BannerPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def change_banner?
    user.admin?
  end

  def change?
    change_banner?
  end
end
