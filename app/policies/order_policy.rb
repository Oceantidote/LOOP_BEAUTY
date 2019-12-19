class OrderPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end

  def new?
    true
  end

  def create?
    new?
  end

  def show?
    record.user == user
  end

  def order_success?
    record.user == user
  end

  def pay?
    show?
  end
end
