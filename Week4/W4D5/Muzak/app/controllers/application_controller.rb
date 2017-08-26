class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?, :login!

  def logged_in?
    !!current_user
  end

  def login!(user)
    @current_user = user
    session[:session_token] = user.session_token
  end

  def logout!
    @current_user, session[:session_token] = nil, nil

  end

  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end

  def ensure_login
    redirect_to root_url unless logged_in?
  end

end
