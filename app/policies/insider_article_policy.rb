class InsiderArticlePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(published: true)
    end
  end

  def show?
    record.published == true || user&.admin
  end
end
