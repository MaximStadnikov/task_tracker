module Types
  module Inputs
    class CreateCommentInput < Types::BaseInputObject
      argument :content, String, required: true
      argument :task_id, ID, required: true
    end
  end
end