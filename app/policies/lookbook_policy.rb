class LookbookPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    user.influencer?
  end

  def create?
    new?
  end

  def show?
    true
  end

  def edit?
    new?
  end

  def update?
    new?
  end

  def destroy?
    new?
  end

  def add_to_bag?
    show?
  end
end
