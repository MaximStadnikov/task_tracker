module Comments
  class Update
    include Interactor::Organizer

    delegate :comment, :comment_params, to: :context

    def call 
      context.fail!(error: "Invalid data") unless comment.update(comment_params)
    end
  end
end
