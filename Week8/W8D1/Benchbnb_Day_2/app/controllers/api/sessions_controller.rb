class Api::SessionsController < ApplicationController

  def create
    @user = User.find_by_credentials(params[:user][:username],
                         params[:user][:password])

    if @user
      login(@user)
      render 'api/users/show'
    else
      render json: ["invalid username/password"], status: 401
    end
  end

  def destroy
    @user = current_user
    if @user
      logout
      render json: {}
    else
      render json: ["No user"], status: 404
    end
  end

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
