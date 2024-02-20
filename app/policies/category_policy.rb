class CategoryPolicy < ApplicationPolicy
  def index?
   true
  end

  def show?
    true
  end

  def new?
    user.super_admin?
  end

  def create?
    new?
  end

  def update?
    true
  end

  def edit?
    true
  end

  def destroy?
    true
  end
end