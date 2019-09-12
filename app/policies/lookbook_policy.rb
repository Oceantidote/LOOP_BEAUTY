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
    (record.user == user || user.admin) && (record.status = "pending" || record.status = "rejected")
  end

  def update?
    edit?
  end

  def destroy?
    user.admin
  end

  def add_to_bag?
    show?
  end
end
