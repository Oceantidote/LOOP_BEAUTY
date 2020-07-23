class LookbookPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    user.influencer? || user&.admin
  end

  def create?
    new?
  end

  def show?
    record.status == 'approved' || record.user == user || user&.admin
  end

  def edit?
    (record.user == user && (record.status == "pending" || record.status == "rejected")) || user.admin
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
