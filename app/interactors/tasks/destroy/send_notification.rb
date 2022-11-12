module Tasks
  class Destroy
    class SendNotification
      include Interactor
    
      delegate :task, :user, :members, :project, to: :context
    
      def call
        members.each do |member|
            if set_ownership(member).role == :owner && member == user
                TaskMailer.task_deleted_by_owner(task, member).deliver_later
            elsif member == user
                TaskMailer.task_deleted(task, member).deliver_later
            elsif set_ownership(member).role == :owner
                TaskMailer.task_deleted_by_member(task, member).deliver_later
            else
                TaskMailer.task_deleted_by_someone(task, member).deliver_later
            end
        end
      end

      private
    
      def set_ownership(action_user)
        @set_ownership = ProjectMembership.find_by(user: action_user, project: project)
      end
    end
  end    
end    