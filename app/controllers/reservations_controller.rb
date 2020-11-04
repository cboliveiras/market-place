class ReservationsController < ApplicationController

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user_id = current_user.id
    @place = Place.find(params[:place_id])
    @reservation.place = @place
    calculate_price
    if @reservation.initial_date.past? || @reservation.final_date.past? || @reservation.final_date < @reservation.initial_date
      redirect_to place_path(@place), notice: 'Please choose a valid date.'
    # elsif booked?(@place)
      # redirect_to place_path(@place), notice: 'Place already booked for those dates.'
    # CHECAR SE A DATA JA FOI BOOKADA
    # elsif @place.reservations.include?
      # @place.reservations include
      # WHERE   where("initial_date < ? AND final_date > ?", initial_date, final_date)
      # redirect_to place_path(@place), notice: 'Place already booked for those dates.'
    else
      if @reservation.save
        redirect_to my_reservations_path, notice: 'Reservation created successfully!'
      else
        redirect_to place_path(@place), notice: 'Failed to create reservation.'
      end
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

  # def booked?(place)
  #   new_reservation = @reservation.initial_date..@reservation.final_date
  #   place.reservations.each do |reservation|
  #     range_booked = reservation.initial_date..reservation.final_date
  #     range_booked.cover?(new_reservation.begin) && range_booked.cover?(new_reservation.end)
  #   end
  # end
end
