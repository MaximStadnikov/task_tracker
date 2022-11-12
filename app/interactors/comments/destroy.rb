module Comments
  class Destroy
    include Interactor

    delegate :comment, to: :context

    def call
      context.fail!(error: "Comment was not deleted") unless destroy_comment
    end

    private

    def destroy_comment
      @destroy_comment = comment.destroy
    end
  end
end
