class Place < ApplicationRecord
  belongs_to :user

  has_many :reservations
  has_many :reviews

  has_many_attached :images

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
