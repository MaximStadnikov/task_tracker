module Tasks
  class Destroy
    class Execute
      include Interactor

      delegate :task, :project, :user, to: :context

      def call
        context.fail!(error: "something went wrong while deleting") unless destroy_task
      end

      private

      def destroy_task
        task.destroy
      end
  end
end
