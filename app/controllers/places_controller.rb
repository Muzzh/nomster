class PlacesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :require_permission, only: :edit
  
  def index
    @places = Place.page(params[:page]).per_page(5)
  end

  def new
    @place = Place.new
  end

  def create
    current_user.places.create(place_params)
    redirect_to root_path
  end

  def show
    @place = Place.find(params[:id])
  end

  def edit
    @place = Place.find(params[:id])
  end

  def update
    @place = Place.find(params[:id])
    current_id = :id
    @place.update_attributes(place_params)
    redirect_to root_path
  end

  def require_permission
    if current_user != Place.find(params[:id]).user
      redirect_to root_path
    end
  end




  private

  def place_params
    params.require(:place).permit(:name, :occurence, :address, :description)
  end


end
