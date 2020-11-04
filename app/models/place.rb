class Place < ApplicationRecord
  belongs_to :user

  has_many :reservations
  has_many :reviews

  has_one_attached :image
end
