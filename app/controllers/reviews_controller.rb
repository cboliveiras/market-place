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
end
