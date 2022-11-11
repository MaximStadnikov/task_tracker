class TaskMailer < ApplicationMailer
  def task_created(task, user, creator)
    @user = user
    @task = task
    @creator = creator
    mail(to: user.email)
  end

  def task_deleted(task, user)
    @task = task
    mail(to: user.emai)
  end

  def task_updated(task, user)
    @task = task
    mail(to: user.emai)
  end

end
