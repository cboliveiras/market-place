class PlacesController < ApplicationController
  def show
    @place = Place.find(params[:id])
    @reservation = Reservation.new
  end
end
