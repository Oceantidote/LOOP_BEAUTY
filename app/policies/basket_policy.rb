class BasketPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(abandoned: true, user: user)
    end
  end

  def show?
    true
  end

  def add_discount_code?
    show?
  end

  def remove_discount_code?
    show?
  end

  def abandon?
    record.user == user
  end
end
