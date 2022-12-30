module Tasks
  class Save
    include Interactor

    delegate :task_params, to: :context

    def call
      context.task = task

      context.fail!(error: "Invalid Data") unless task.save
    end

    private

    def task
      @task ||= Task.new(task_params)
    end
  end
end
