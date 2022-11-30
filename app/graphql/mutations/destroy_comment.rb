module Mutations
  class DestroyComment < BaseMutation
    include GraphqlErrors

    argument :input, Types::Inputs::DestroyCommentInput, required: true
    
    type Types::Payloads::DestroyCommentPayload

    def resolve(input:)
        comment = Comment.find(input.comment_id)
        result = Comments::Destroy.call(comment: comment)
        if result.success?
            result.to_h
        else
            result.to_h.merge({errros: formatted_errors(result.comment)})
        end
    end

  end
end