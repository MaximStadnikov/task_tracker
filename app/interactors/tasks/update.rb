module Tasks
  class Update
    include Interactor

    delegate :task_params, :task ,to: :context
    
    def call
      context.fail!(error: "something went wrong while updating task") unless update_task
    end

    def update_task
      task.update(task_params)
    end

  end
end