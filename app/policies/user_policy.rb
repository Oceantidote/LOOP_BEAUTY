class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def dashboard?
    true
  end

  def show?
    true
  end

  def q_and_a
    true
  end

end
