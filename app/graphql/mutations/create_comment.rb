module Mutations
  class CreateComment < BaseMutation
    
    include GraphqlErrors

    argument :input, Types::Inputs::CreateCommentInput, required: true

    type Types::Payloads::CreateCommentPayload

    def resolve(input:)
      task = Task.find(input.task_id)
      result = Comments::Create.call(comment_params: input.to_h.except(:task_id), user: current_user, task: task)
      if result.succes?
        result.to_h
      else
        result.to_h.merge(errors: formatted_errors(result.comment))
      end
    end

  end
end