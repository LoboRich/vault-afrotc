class ClientPolicy < ApplicationPolicy
  # NOTE: Up to Pundit v2.3.1, the inheritance was declared as
  # `Scope < Scope` rather than `Scope < ApplicationPolicy::Scope`.
  # In most cases the behavior will be identical, but if updating existing
  # code, beware of possible changes to the ancestors:
  # https://gist.github.com/Burgestrand/4b4bc22f31c8a95c425fc0e30d7ef1f5

  class Scope < ApplicationPolicy::Scope
    def resolve
      if user.admin? || user.ceo?
        scope.all
      else
        scope.where(id: user.id)
      end
    end
  end

  def index?
    # user.admin? || user.ceo?
  end

  def show?
    # user.admin? || user.ceo?
  end

  def new?
    user.admin? || user.ceo? || user.sales?
  end

  def create?
    user.admin? || user.ceo? || user.sales?
  end

  def edit?
    # user.admin? || user.ceo?
  end

  def update?
    # user.admin? || user.ceo?
  end

  def destroy?
    user.admin? || user.ceo?
  end

end
