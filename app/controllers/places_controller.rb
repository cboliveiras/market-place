class PlacesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :show]

  def index
    @places = Place.all
  end

  def show
    @place = Place.find(params[:id])
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
end
