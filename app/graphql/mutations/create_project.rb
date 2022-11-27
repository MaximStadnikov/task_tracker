module Mutations
  class CreateProject < BaseMutation
    argument :input, Types::Inputs::CreateProjectInput, required: true

    type Types::Payloads::CreateProjectPayload

    def resolve(input:)
      result = Projects::Create.call(project_params: input.to_h, user: current_user)

      result.success? ? result : nil
    end
  end
end
