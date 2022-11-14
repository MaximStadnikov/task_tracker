module Projects
  class Update
    include Interactor

    delegate :project_params, to: :context

    def call
      context.update
      context.fail!(error: "Error") unless project.update

      if context.success?
        ProjectMailer.with(user: current_user).project_updated.deliver_later
      end
    end

    private 

    def update
      @project.update(project_params)
    end
  end
end