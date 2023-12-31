class ItemPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
    def resolve
      scope.all
    end
  end

  def new
    true
  end

  def create?
    true
  end

  def show?
    true
  end

  def edit?
    record.user == user
  end

  def destroy?
    record.user == user
  end

  def update_all
    true
  end
end
