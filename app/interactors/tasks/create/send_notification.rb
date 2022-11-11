module Tasks
  class Create
    class SendNotification
      include Interactor

      delegate :task, :user, to: :context

      def call
        context.users = task.project.users
        context.creator = user

        TaskMailer.task_created(task, user).deliver_later
      end
    end
  end
end
