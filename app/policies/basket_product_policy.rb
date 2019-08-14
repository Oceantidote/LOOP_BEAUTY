class BasketProductPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  def update?
    create?
  end

  def destroy?
    create?
  end

  def set_credit_purchase?
    record.product.demoable && user&.influencer? # TO BE REVEIWED BY WRIGHTY
  end
end
