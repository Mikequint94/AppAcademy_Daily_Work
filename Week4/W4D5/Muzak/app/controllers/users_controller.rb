class UsersController < ApplicationController

  def new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login!(@user)
      redirect_to bands_url

    else
      flash[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def show
    render :show
  end
end
