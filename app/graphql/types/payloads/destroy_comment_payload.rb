module Types
  module Payloads
    class DestroyCommentPayload < Types::BaseObject
      field :comment, Types::CommentType, null: false
    end
  end
end
