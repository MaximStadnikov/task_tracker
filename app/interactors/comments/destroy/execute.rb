module Comments
  class Destroy
    class Execute
      include Interactor

      delegate :comment, to: :context

      def call
        content.fail!(error: "Invalid data") unless comment.destroy
      end
    end
  end
end
