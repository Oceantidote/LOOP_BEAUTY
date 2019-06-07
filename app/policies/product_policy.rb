class ProductPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      raise
      scope.all
    end
  end

  def show?
    true
  end
end
