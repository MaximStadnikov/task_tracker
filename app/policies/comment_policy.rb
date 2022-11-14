class CommentPolicy < ApplicationPolicy
  authorize :user, allow_nil: true

  def new?
    create?
  end

  def create?
    member?
  end

  def edit?
    update?
  end

  def update?
    member?
  end

  def destroy?
    member?
  end

  private

  def member?
    ProjectMembership.find_by(project: record.project, user: user).present?
  end
end
