class PlacesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :new]

  def index
    @places = Place.all
  end

  def show
    @place = Place.find(params[:id])
    @reservation = Reservation.new
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(place_params)
    @place.user = current_user
    if @place.save
      redirect_to place_path(@place), notice: 'Place created!'
    else
      render :new
    end
  end

  def destroy
    @place = Place.find(params[:id])
    @place.destroy
    redirect_to :root

  def my_places
    @places = Place.where(user: current_user)

  end

  private

  def place_params
    params.require(:place).permit(:name, :location, :location_type, :price_per_day)
  end
end
