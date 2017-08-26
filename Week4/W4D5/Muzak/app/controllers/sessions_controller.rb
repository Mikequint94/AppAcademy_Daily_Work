class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    # reset session token
    # set session[:session...] = session token
    user = User.find_by_credentials(user_params)
    if user
      login!(user)
      redirect_to bands_url
    else
      flash[:errors] = ['B3tCh, you need 2 make acc0unt f3r$t']
      render :new
    end
  end

  def destroy
    logout!
    redirect_to login_url
  end
end
