class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user 
      if logged_in?
        current_user = User.find(session[:user_id])
      end
  end

  def logged_in?
       !!session[:user_id]
  end

  def require_login
      if !logged_in?
        redirect_to login_path
      end
  end

end
