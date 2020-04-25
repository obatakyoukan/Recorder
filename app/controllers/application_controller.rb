class ApplicationController < ActionController::Base
  private def current_user
    User.find_by(id: session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
end
