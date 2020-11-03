class ReviewsController < ApplicationController

  def new
    @place = Place.find(params[:place_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @place = Place.find(params[:place_id])
    @review.place = @place
    if review.save
      redirect_to my_reservations_path
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:user_rating, :place_rating, :comments)
  end

  def set_place

  end

  def review_avg
    count
    sum
    avg = sum / count
  end

end
