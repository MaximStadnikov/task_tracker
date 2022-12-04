module Mutations
  class SignUp < Mutations::BaseMutation
    argument :input, Types::Inputs::SignUpInput, required: true

    type Types::Payloads::SignUpPayload

    def resolve(input:)
      Users::Save.call(user_params: input.to_h).to_h
    end
  end
end
