module Types
  module Payloads
    class CreateTaskPayload < Types::BaseObject
      field :task, Types::TaskType, null: false
      field :errors, [Types::UserError], null: false
    end
  end
end
