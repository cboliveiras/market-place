class ReviewsController < ApplicationController
  before_action :set_place, only: [:new, :create]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.place = @place
    if @review.save
      review_avg(@place)
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
    @place = Place.find(params[:place_id])
  end

  def review_avg(place)
    n = place.reviews.count
    sum = 0
    avg = 0
    place.reviews.each do |review|
      sum += review.place_rating
    end
    avg = sum / n
    place.place_avg_review = avg
    place.save
    # place.update(place_avg_review: avg)
  end
end
