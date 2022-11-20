module Projects
  class Destroy
    class SendNotification
      include Interactor

      delegate :project,:user, to: :context

      def call
        ProjectMailer.project_destroyed(project, user).deliver_later
      end
    end
  end
end
