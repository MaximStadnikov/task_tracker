module Types
  module Payloads
    class SignInPayload < Types::BaseObject
      field :user, CurrentUserType, null: false
      field :access_token, String, null: true
      field :errors, [Types::UserError], null: true
    end
  end
end
