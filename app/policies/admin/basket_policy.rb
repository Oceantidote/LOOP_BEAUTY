class Admin::BasketPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(abandoned: true)
    end
  end
end
