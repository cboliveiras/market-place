class Place < ApplicationRecord
  belongs_to :user

  has_many :reservations
  has_many :reviews

  has_one_attached :image

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
  
  validates :name, presence: true
  validates :location, presence: true
  validates :location_type, presence: true
  validates :price_per_day, presence: true
end
