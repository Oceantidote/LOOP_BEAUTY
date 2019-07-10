class WishlistProductPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  def destroy?
    record.wishlist.user == user
  end

  def add_to_bag?
    destroy?
  end
end
