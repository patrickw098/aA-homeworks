class BandsController < ApplicationController
  before_action :redirect_to_root

  def index
    @bands = Band.all

    render :index
  end

  def new
    @band = Band.new

    render :new
  end

  def show
    @band = Band.find(params[:id])
    if @band
      render :show
    else
      flash[:errors] = ["No such band."]
      redirect_to bands_url
    end
  end

  def create
    @band = Band.new(band_params)

    if @band.save
      redirect_to band_url(@band.id)
    else
      flash[:errors] = @band.errors.full_messages
      redirect_to new_band_url
    end
  end

  def edit
    @band = Band.find(params[:id])

    if @band
      render :edit
    else
      flash[:errors] = ['No such band']
      redirect_to bands_url
    end
  end

  def update
    @band = Band.find(params[:id])

    if @band.update(band_params)
      redirect_to band_url(@band)
    else
      flash[:errors] = @band.errors.full_messages
      redirect_to bands_url
    end
  end

  def destroy
    @band = Band.find(params[:id])
    @band.delete

    redirect_to bands_url
  end



  private

  def band_params
    params.require(:band).permit(:name)
  end



end
