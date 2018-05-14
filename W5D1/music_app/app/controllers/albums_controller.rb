class AlbumsController < ApplicationController
  before_action :redirect_to_root

  def show
    @album = Album.find(params[:id])

    render :show
  end

  def new
    @album = Album.new

    render :new
  end

  def create
    @album = Album.new(album_params)
    @album.band_id = params[:band_id]

    if @album.save
      redirect_to album_url(params[:id])
    else
      flash[:errors] = @album.errors.full_messages
      redirect_to bands_url
    end
  end

  private

  def album_params
    params.require(:album).permit(:title, :year, :live)
  end


end
