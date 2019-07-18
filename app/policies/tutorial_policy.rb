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
    new?
  end

  def update?
    new?
  end

  def destroy?
    new?
  end
end
