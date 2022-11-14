module Tasks
  class Destroy
    class SendNotifications
      include Interactor

      delegate :task, :user, :project, to: :context

      def call
        TaskMailer.task_deleted(task, user, project).deliver_later
      end
    end
  end
end
