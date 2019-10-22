class Admin::UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    user&.admin?
  end

  def create?
    new?
  end

  def edit?
    new?
  end

  def update?
    new?
  end

  def publish?
    new?
  end

  def unpublish?
    publish?
  end

  def portal?
    new?
  end

  def sales_report?
    new?
  end

  def activity_report?
    new?
  end

  def categories?
    new?
  end
end
