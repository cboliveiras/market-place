class PlacesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :new]
  before_action :set_place, only: [:show, :edit, :update, :destroy]

  def index
    #@places = Place.all
    @places = Place.geocoded

    @markers = @places.geocoded.map do |place|
      {
        lat: place.latitude,
        lng: place.longitude
      }
    if params[:search_query].present?
      sql_query = "name ILIKE :search_query OR location ILIKE :search_query"
      @places = Place.where(sql_query, search_query: "%#{params[:search_query]}%")
    else
      @places = Place.all
    end
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(place_params)
    @place.user = current_user
    if @place.save
      Cloudinary::Uploader.upload(place_params[:image])
      redirect_to my_places_path, notice: "Place created!"
    else
      render :new
    end
  end

  def show
    @reservation = Reservation.new
    review_avg(@place)
  end

  def edit
    @place = Place.find(params[:id])
    unless current_user.id == @place.user_id
      flash[:notice] = "Access denied"
      redirect_to :root
    end
  end

  def update
    @place.update(place_params)
    redirect_to my_places_path
  end

  def destroy
    @place.destroy
    redirect_to my_places_path
  end

  def my_places
    @places = Place.where(user: current_user)
  end

  private

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
  end

  def place_params
    params.require(:place).permit(:name, :location, :location_type, :price_per_day, :image)
  end

  def set_place
    @place = Place.find(params[:id])
  end
end
