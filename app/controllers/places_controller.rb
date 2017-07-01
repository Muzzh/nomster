class PlacesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :require_permission, only: [:edit, :update, :destroy]
  
  def index
    @places = Place.page(params[:page]).per_page(5)
  end

  def new
    @place = Place.new
  end

  def create
    @place = current_user.places.create(place_params)
    if @place.valid?
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end 
  end

  def show
    @place = Place.find(params[:id])
  end

  def edit
    @place = Place.find(params[:id])
    #if @place.user != current_user
    #  return render text: 'Out of bounds!', status: :forbidden
    #end

  end

  def update
    @place = Place.find(params[:id])
    #if @place.user != current_user
    #  return render text: 'Out of bounds', status: :forbidden
    #end
    @place.update_attributes(place_params)
    if @place.valid?
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @place = Place.find(params[:id])
    @place.destroy
    redirect_to root_path
  end


  def require_permission
    if current_user != Place.find(params[:id]).user
      return render text: 'Out of bounds', status: :forbidden
      #redirect_to root_path
    end
  end


  private

  def place_params
    params.require(:place).permit(:name, :occurence, :address, :description)
  end


end
