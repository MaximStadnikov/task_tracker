module Tasks
  class Destroy
    include Interactor

    delegate :task, to: :context

    def call
       context.fail!(error: "something went wrong while deleting") unless destroy_task
    end

    def destroy_task
        task.destroy
    end

  end
end