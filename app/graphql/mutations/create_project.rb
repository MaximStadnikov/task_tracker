module Mutations
  class CreateProject < Mutations::BaseMutation
    argument :name, String, required: true
    argument :description, String, required: true

    field :project, Types::ProjectType, null: false
    field :errors, [String], null: false

    def resolve(name:, description:)
      project = Project.new(name: name, description: description)

      if project.save
        {
          project: project,
          errors: []
        }
      else
        {
          project: nil,
          errors: project.errros.full_messages
        }
      end
    end
  end
end
