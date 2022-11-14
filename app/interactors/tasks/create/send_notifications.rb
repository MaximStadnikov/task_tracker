module Tasks
  class Create
    class SendNotifications
      include Interactor

      delegate :task, :user, to: :context

      def call
        task.project.users.each do |user_member|
          TaskMailer.task_created(task, user_member, user).deliver_later
        end
      end
    end
  end
end
