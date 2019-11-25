class TutorialPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all.where(status: "approved")
    end
  end

  def all_videos?
    true
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
    (record.user == user || user.admin) && (record.status == "pending" || record.status == "rejected")
  end

  def update?
    edit?
  end

  def destroy?
    user.admin
  end
end
