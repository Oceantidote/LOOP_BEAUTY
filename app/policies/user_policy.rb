class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user&.admin?
        scope.all
      else
        # scope.where(published: record == user).where(influencer: record == user)
        scope.where(published: true).where(influencer: true)
      end
    end
  end

  def dashboard?
    record == user || user.admin?
  end

  def my_orders?
    dashboard?
  end

  def my_products?
    dashboard?
  end

  def refer_a_friend?
    dashboard?
  end

  def showroom?
    dashboard?
  end

  def wishlist?
    dashboard?
  end

  def account_details?
    dashboard?
  end

  def share?
    dashboard?
  end

  def uploads?
    dashboard?
  end

  def analytics?
    dashboard?
  end

  def preference_centre?
    dashboard?
  end

  def show?
    true
  end

  def q_and_a
    true
  end

  def make_up?
    true
  end

  def update?
    dashboard?
  end

  def change_password?
    dashboard?
  end

end
