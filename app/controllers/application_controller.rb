# This class to configure things such as request forgery protection
# and filtering of sensitive request parameters.
class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  include DeviseTokenAuth::Concerns::SetUserByToken
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
end
