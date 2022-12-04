module Mutations
  class DestroyProject < BaseMutation
    include GraphqlErrors
    argument :input, Types::Inputs::DestroyProjectInput

    type Types::Payloads::DestroyProjectPayload

    def resolve(input:)
      project = Project.find(input.id)
      result = Projects::Destroy.call(project_params: input.to_h.except(:id), project: project)
      if result.success?
        result.to_h
      else
        result.to_h.merge(errors: formatted_errors(result.project))
      end
    end
  end
end
