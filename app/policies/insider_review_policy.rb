class InsiderReviewPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    user.influencer || user.admin
  end
end
