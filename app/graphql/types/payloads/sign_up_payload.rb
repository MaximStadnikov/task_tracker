module Types
  module Payloads
    class SignUpPayload < Types::BaseObject
      field :current_user, CurrentUserType, null: false, method: :user
      field :errors, [Types::UserError], null: true
      field :access_token, String, null: true
    end
  end
end
