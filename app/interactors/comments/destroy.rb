module Comments
  class Destroy
    include Interactor

    delegate :comment, to: :context

    def call
      context.fail!(error: "Comment was not deleted") unless comment.destroy
    end
  end
end
