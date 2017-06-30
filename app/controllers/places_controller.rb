class PlacesController < ApplicationController
  
  def index
    @places = Place.page(params[:page]).per_page(5)
  end

  def new
    @place = Place.new
  end

  def create
    Place.create(place_params)
    redirect_to root_path
  end






  private

  def place_params
    params.require(:place).permit(:name, :occurence, :address, :description)
  end


end
