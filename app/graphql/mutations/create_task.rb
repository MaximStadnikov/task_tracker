module Mutations
  class CreateTask < BaseMutation
    include GraphqlErrors

    argument :input, Types::Inputs::CreateTaskInput, required: true

    type Types::Payloads::CreateTaskPayload

    def resolve(input:)
      project = Project.find(input.project_id)
      result = Tasks::Create.call(project: project, task_params: input.to_h.except(:project_id))
      result.to_h.merge(errors: formatted_errors(result.task))
    end
  end
end
