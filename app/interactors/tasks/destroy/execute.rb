module Tasks
  class Destroy
    class Execute
      include Interactor

      delegate :task, to: :context

      def call
        context.fail!(error: "invalid data") unless task.destroy
      end
    end
  end
end
