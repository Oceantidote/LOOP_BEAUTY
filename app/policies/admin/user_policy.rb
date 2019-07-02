class Admin::UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    user.admin?
  end

  def create?
    new?
  end

  def publish?
    user&.admin?
  end

  def unpublish?
    publish?
  end
end
