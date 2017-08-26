class BandsController < ApplicationController
  before_action :ensure_login

  def index
    @bands = Band.all
    render :index
  end

  def new
    render :new
  end

  def create
    @band = Band.new(band_params)

    if @band.save
      redirect_to band_url(@band)
    else
      flash[:errors] = @band.errors.full_messages
      render :new
    end
  end

  def show
    @band = Band.find_by(id: params[:id])
    render :show
  end

  private
  def band_params
    params.require(:band).permit(:name)
  end

end
