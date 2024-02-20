class UserRolePolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    user.admin? || user.super_admin?
  end

  def update?
    true
  end

  def edit?
    true
  end
end