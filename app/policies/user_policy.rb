class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user&.admin?
        scope.all
      else
        scope.where(published: true).where(influencer: true)
      end
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

  def publish?
    user&.admin?
  end

  def unpublish?
    publish?
  end

  def make_up?
    true
  end

end
