class AlbumsController < ApplicationController
  before_action :ensure_login

  def new
    @band = Band.find_by(id: params[:band_id])
    render :new
  end

  def create
    @album = Album.new(album_params)

    if @album.save
      redirect_to album_url(@album)
    else
      flash[:errors] = @album.errors.full_messages
      render :new
    end
  end

  def show
    @album = Album.find_by(id: params[:id])
    render json: @album
  end

  def album_params
    params.require(:album).permit(:band_id, :title, :year, :genre)
  end
end
