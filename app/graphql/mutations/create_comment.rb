module Mutations
  class CreateComment < BaseMutation
    include GraphqlErrors
    argument :input, Types::Inputs::CreateCommentInput, required: true

    type Types::Payloads::CreateCommentPayload

    def resolve(input:)
      task = Task.find(input.id)
      result = Comments::Create.call(comment_params: input.to_h.except(:id), task: task, user: current_user)
      if result.success?
        result.to_h
      else
        result.to_h.merge(errors: formatted_errors(result.task))
      end
    end
  end
end
