class ApplicationController < ActionController::Base
  # rescue_from ActionController::RoutingError, with: :redirect_missing

  helper_method :current_user, :logged_in?

  def login(user)
    @current_user = user
    session[:session_token] = user.reset_session_token!
  end

  def current_user
    return nil unless session[:session_token]
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def logged_in?
    !!current_user
  end

  def logout
    current_user.reset_session_token!
    session[:session_token] = nil
  end

  def redirect_to_root
    redirect_to new_session_url unless logged_in?
  end

  def redirect_missing
    redirect_to root_path
  end
end
