class ApplicationController < ActionController::Base
  include ActionController::Cookies
  protect_from_forgery with: :exception
  skip_before_action :verify_authenticity_token
    
end