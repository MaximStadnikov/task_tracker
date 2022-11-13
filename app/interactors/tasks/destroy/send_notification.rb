module Tasks
  class Destroy
    class SendNotification
      include Interactor

      delegate :project, :task, :user, to: :context

      def call
        mail_owner.deliver_later unless ProjectMembership.find_by(project: project, user: user).owner?
        TaskMailer.task_destroyed_to_initiator(project, task, user).deliver_later
        TaskMailer.task_destroyed_to_members(project, task, user).deliver_later
      end

      private

      def mail_owner
        TaskMailer.task_destroyed_to_owner(project, task)
      end
    end
  end
end
