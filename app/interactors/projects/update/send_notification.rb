module Projects
  class Update
    class SendNotification
      include Interactor

      delegate :project, :user, to: :context

      def call 
        ProjectMailer.project_updated(project, user).deliver_later
      end
    end
  end
end
