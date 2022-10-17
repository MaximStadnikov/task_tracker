class ApplicationController < ActionController::Base
  class UserNotAuthenticated < StandardError; end 
  def current_user
    @current_user ||= User.find_by
  end
end
