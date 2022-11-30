module Types
  module Inputs
    class DestroyCommentInput < Types::BaseInputObject
      argument :comment_id, ID, required: true
    end
  end
end
    