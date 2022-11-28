module Mutations
  class UpdateProject < BaseMutation
    include GraphqlErrors

    argument :input, Types::Inputs::UpdateProjectInput, required: true

    type Types::Payloads::UpdateProjectPayload

    def resolve(input:)
      project = Project.find(input.id)
      result = Projects::Update.call(project: project, project_params: input.to_h, user: current_user)

      if result.success?
        result.to_h
      else
        result.to_h.merge(errors: formatted_errors(result.project))
      end
    end
  end
end
