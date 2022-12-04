module Types
  module Payloads
    class CreateCommentPayload < Types::BaseObject
      field :comment, Types::CommentType, null: false
      field :errors, [Types::UserError], null: true
    end
  end
end
