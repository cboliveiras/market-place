class ReservationsController < ApplicationController
  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user_id = current_user.id
    @place = Place.find(params[:place_id])
    @reservation.place = @place
    calculate_price

    if @reservation.save
      redirect_to root_path
      # Substitute by my_reservations_path after creating it.
    else
      redirect_to new_user_session_path, notice: 'You are not logged in.'
    end
  end

  private

  def calculate_price
    days = @reservation.final_date - @reservation.initial_date
    price = @place.price_per_day
    total_price = price * days
    @reservation.price = total_price
  end

  def reservation_params
    params.require(:reservation).permit(:initial_date, :final_date)
  end
end
