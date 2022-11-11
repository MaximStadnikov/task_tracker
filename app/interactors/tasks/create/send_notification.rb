module Tasks
  class Create
    class SendNotification
      include Interactor

      delegate :task, :user, to: :context

      def call
        context.users = task.project.users
        context.creator = user

        TaskMailer.task_created(task, user, user).deliver_later
      end
    end
  end

  class Update
    class SendNotification
      include Interactor

      delegate :task, :user, to: :context

      def call
        TaskMailer.task_updated(task, user).deliver_later
      end
    end
  end

  class Destroy
    class SendNotification
      include Interactor

      delegate :task, :user, to: :context

      def call
        TaskMailer.task_deleted(task, user).deliver_later
      end
    end
  end

end
