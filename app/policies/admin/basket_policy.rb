class Admin::BasketPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.admin?
        scope.where(abandoned: true)
      else
        raise Pundit::NotAuthorizedError, 'not allowed to view this action'
      end
    end
  end
end
