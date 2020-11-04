class Place < ApplicationRecord
  belongs_to :user

  has_many :reservations
  has_many :reviews

  has_many_attached :images

  def average_rating
    reviews = Review.where(place_id: self.id)
    reviews.average(:place_rating).to_i
  end
end
