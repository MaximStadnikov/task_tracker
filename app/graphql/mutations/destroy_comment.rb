module Mutations
  class DestroyComment < BaseMutation
    include GraphqlErrors

    argument :input, Types::Inputs::DestroyCommentInput, required: true

    type Types::Payloads::DestroyCommentPayload

    def resolve(input:)
      comment = Comment.find(input.comment_id)
      result = Comments::Destroy.call(comment: comment)
      result.to_h
    end
  end
end
