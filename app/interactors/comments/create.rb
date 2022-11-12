module Comments
  class Create
    include Interactor

    delegate :user, :comment_params, to: :context

    def call
      context.comment = comment

      context.fail!(error: "The comment did not save correctly") unless comment.save
    end

    private

    def comment
      @comment = Comment.new(comment_params)
    end
  end
end
