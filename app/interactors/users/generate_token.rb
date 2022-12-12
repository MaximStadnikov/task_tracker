module Users
  class GenerateToken
    include Interactor

    delegate :user, to: context

    def call
        context.fail!(error: "user empty") unless user.present?
        
        context.access_token = access_token
    end

    def access_token
      JWT.encode(payload, jwt_secret, "HS256")
    end

    def jwt_secret
      ENV.fetch("JWT_SECRET")
    end

    def payload
        {
          sub: user.id
        }
    end

  end
end
