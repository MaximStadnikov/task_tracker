module Types
  module Payloads
    class UpdateCommentPayload < Types::BaseObject
      field :comment, Types::CommentType, null: false
    end
  end
end
