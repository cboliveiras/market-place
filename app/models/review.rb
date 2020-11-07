class Review < ApplicationRecord
  belongs_to :user
  belongs_to :place

  validates :user_rating, inclusion: { in: 1..5 }
  validates :place_rating, inclusion: { in: 1..5 }
  validates :user_rating, presence: true
  validates :place_rating, presence: true
  validates :comments, presence: true
end
