module Comments
  class Destroy
    include Interactor

    delegate :comment, to: :context

    def call
      context.fail!(error: "Invalid data") unless comment.destroy
    end
  end
end
