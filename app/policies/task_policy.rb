class TaskPolicy < ApplicationPolicy
  authorize :user, allow_nil: true

  def index?
    true
  end

  def show?
    member?
  end

  def new?
    create?
  end

  def create?
    member?
  end

  def destroy?
    member?
  end

  def edit?
    update?
  end

  def update?
    member?
  end

  private

  def member?
    ProjectMembership.find_by(user: user, project: record.project).present?
  end
end
