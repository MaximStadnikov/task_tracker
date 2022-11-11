class TaskMailer < ApplicationMailer
  def task_created(task, user, creator)
    @user = user
    @task = task
    @creator = creator
    mail(to: user.email)
  end
end
