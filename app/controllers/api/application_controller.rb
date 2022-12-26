module Api
  class ApplicationController < ActionController::API
    include JwtTokenAuthentication

    def authenticate_user!
      return if access_token.present?

      render json: { msg: "Not authenticated" }
    end
  end
end
