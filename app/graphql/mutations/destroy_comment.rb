module Mutations
  class DestroyComment < BaseMutation
    include GraphqlErrors

    argument :input, Types::Inputs::DestroyCommentInput, required: true

    type Types::Payloads::DestroyCommentPayload

    def resolve(input:)
      comment = Comment.find(input.id)
      result = Comments::Destroy.call(comment: comment, project_params: input.to_h, user: current_user)

      if result.success?
        result.to_h
      else
        result.to_h.merge(errors: formatted_errors(result.comment))
      end
    end
  end
end
