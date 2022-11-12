class TaskMailer < ApplicationMailer
  def task_created(task, user, creator)
    @user = user
    @task = task
    @creator = creator
    mail(to: user.email)
  end

  # mailers for delete
  def task_deleted(task, user)
    set_email(task, user)
  end

  def task_deleted_by_owner(task, user)
    set_email(task, user)
  end

  def task_deleted_by_member(task, user)
    set_email(task, user)
  end

  def task_deleted_by_someone(task, user)
    set_email(task, user)
  end

  #mailers for update
  def task_updated(task, user)
    @task = task
    mail(to: user.emai)
  end

  private

  def set_email(task, user)
    @task = task
    mail(to: user.email)
  end

end
