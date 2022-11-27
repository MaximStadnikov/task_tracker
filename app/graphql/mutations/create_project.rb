module Mutations
  class CreateProject < BaseMutation
    argument :name, String, required: true
    argument :description, String, required: false

    type Types::ProjectType

    def resolve(**options)
      result = Projects::Create.call(project_params: options, user: current_user)

      result.success? ? result.project : nil
    end
  end
end
