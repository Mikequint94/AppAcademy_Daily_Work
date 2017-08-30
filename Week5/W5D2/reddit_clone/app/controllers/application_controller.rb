class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :logged_in?, :current_user

  def logged_in?
    !!current_user
  end

  def current_user
    return nil unless session[:session_token]
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def login(user)
    session[:session_token] = user.reset_session_token!
  end

  def logout
    current_user.reset_session_token! if current_user
    session[:session_token] = nil
    @current_user = nil
    redirect_to subs_url
  end

  def require_logged_in
    redirect_to new_session_url unless logged_in?
    flash[:errors] = ['You Must Be Signed In To Do That!'] unless logged_in?
  end
end
