class ProductPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    user.admin?
  end

  def show?
    true
  end

  def search_products?
    true
  end

  def my_product?
    true
  end
end

