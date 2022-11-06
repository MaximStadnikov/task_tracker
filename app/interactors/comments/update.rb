module Comments
  class Update
    include Interactor::Organizer

    organize Tasks::Update

    include Interactor

    delegate :comment, :comment_params, to: :context

    def call
      context.fail(error: "Invalid Data") unless comment.update(comment_params)
    end
  end
end
