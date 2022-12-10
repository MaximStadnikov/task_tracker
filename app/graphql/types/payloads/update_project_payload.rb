module Types
  module Payloads
    class UpdateProjectPayload < Types::BaseObject
      field :project, Types::ProjectType, null: false
      field :errors, [Types::UserError], null: true
    end
  end
end
