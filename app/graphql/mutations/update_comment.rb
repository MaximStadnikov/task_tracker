module Mutations
  class UpdateComment < BaseMutation
    argument :input, Types::Inputs::UpdateCommentInput, required: true

    type Types::Payloads::UpdateCommentPayload

    def resolve(input:)
      comment = Comment.find(input.id)
      result = Comments::Update.call(comment: comment, comment_params: input.to_h)
      if result.success?
        result.to_h
      else
        result.to_h.merge({ errors: prepared_params(result.error) })
      end
    end
  end
end
