module Types
  module Payloads
    class DestroyCommentPayload < Types::BaseObject
      field :comment, Types::CommentType, null: true
      field :errors, [Types::UserError], null: true
    end
  end
end
