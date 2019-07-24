class FreebiePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(display: true)
    end
  end
end
