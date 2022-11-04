class ApplicationController < ActionController::Base
  include Authentication
  include SessionsHelper
end
