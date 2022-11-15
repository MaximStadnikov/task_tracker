module Projects
  class Destroy
    class SendNotification
        include Interactor

        delegate :user, :project, to: :context

        def call
            ProjectMailer.project_destroyed(project, user)
        end
    end
  end 
end
