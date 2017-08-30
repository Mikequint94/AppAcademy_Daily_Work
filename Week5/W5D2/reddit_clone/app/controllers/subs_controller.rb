class SubsController < ApplicationController

  before_action :require_logged_in, only: [:new, :create, :edit, :update]

  def require_be_mod
    unless @sub.moderator == current_user
      redirect_to sub_url(@sub)
      flash[:errors] = ['Must Be Moderator to do that!']
    end
  end

  def new
    @sub = Sub.new
  end

  def create
    @sub = Sub.new(sub_params)
    @sub.moderator_id = current_user.id
    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash[:errors] = @sub.errors.full_message
      render :new
    end
  end

  def index
    @subs = Sub.all
  end

  def show
    @sub = Sub.find(params[:id])
  end

  def edit
    @sub = Sub.find(params[:id])
    require_be_mod
  end

  def update
    @sub = current_user.moderated_subs.find(params[:id])
    require_be_mod
    if @sub.update_attributes(sub_params)
      redirect_to sub_url(@sub)
    else
      flash[:errors] =@sub.errors.full_messages
      render :edit
    end
  end

  private

  def sub_params
    params.require(:sub).permit(:title, :description)

  end
end
