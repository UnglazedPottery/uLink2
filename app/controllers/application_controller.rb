class ApplicationController < ActionController::Base
    # protect_from_forgery with: :exception
    # skip_before_action :verify_authenticity_token
  
    helper_method :current_user
    
    def current_user
      if session[:current_user_id]
        @current_user ||= User.find(session[:current_user_id])
      else
        @current_user = nil
      end
    end
  
  end