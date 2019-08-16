class CustomerReviewPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    user.ordered_products.include?(record.product)
  end
end
