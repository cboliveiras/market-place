class Place < ApplicationRecord
  belongs_to :user

  has_many :reservations
  has_many :reviews

  has_one_attached :image

  validates :name, presence: true
  validates :location, presence: true
  validates :location_type, presence: true
  validates :price_per_day, presence: true
end
