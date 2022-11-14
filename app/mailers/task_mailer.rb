class TaskMailer < ApplicationMailer
  def task_created(task, user, creator)
    @user = user
    @task = task
    @creator = creator
    mail(to: user.email)
  end

  # mailers for delete
  def task_deleted(task, user, project)
    @members = project.users
    @task = task

    @members.each do |member|
      @message = if ownership(member).role == :owner && member == user
                   "You deleted your task, named '#{@task.title}'"
                 elsif member == user
                   "You deleted a task, named '#{@task.title}'"
                 elsif ownership(member).role == :owner
                   "A employee of you deleted a task, named '#{@task.title}'"
                 else
                   "Someone of you deleted a task, named '#{@task.title}'"
                 end
      mail(to: member)
    end
  end

  # mailers for update
  def task_updated(task, user)
    @task = task
    mail(to: user.emai)
  end

  private

  def ownership(action_user)
    @ownership = ProjectMembership.find_by(user: action_user, project: project)
  end
end
