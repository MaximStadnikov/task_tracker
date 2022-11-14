module Tasks
  class Update
    class SendNotifications
      include Interactor

      delegate :task, :user, to: :context

      def call
        TaskMailer.task_updated(task, user).deliver_later
      end
    end
  end
end
