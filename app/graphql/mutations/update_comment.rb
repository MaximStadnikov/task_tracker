module Mutations
  class UpdateComment < BaseMutation
    include GraphqlErrors

    argument :input, Types::Inputs::UpdateCommentInput, required: true

    type Types::Payloads::UpdateCommentPayload

    def resolve(input:)
      comment = Comment.find(input.comment_id)
      result = Comments::Update.call(comment: comment, comment_params: input.to_h.except(:comment_id))
      result.to_h
    end
  end
end
