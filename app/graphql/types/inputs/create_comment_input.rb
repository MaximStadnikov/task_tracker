module Types
  module Inputs
    class CreateCommentInput < Types::BaseInputObject
      argument :id, ID, required: true
      argument :content, String, required: true
    end
  end
end
