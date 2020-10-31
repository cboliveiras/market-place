class ReservationsController < ApplicationController
  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user_id = current_user.id
    @place = Place.find(params[:place_id])
    @reservation.place = @place
    calculate_price

    if @reservation.save
      redirect_to my_reservations_path, notice: 'Created reservation successfully!'
      # Substitute by my_reservations_path after creating it.
    else
      redirect_to place_path(@place), notice: 'Failed to create reservation.'
    end
  end

  def my_reservations
    @user = current_user
  end

  def destroy
    @reservation = Reservation.find(params[:id]).destroy
    redirect_to my_reservations_path
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
