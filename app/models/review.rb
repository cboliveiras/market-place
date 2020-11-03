class Review < ApplicationRecord
  belongs_to :user
  belongs_to :place

  validates :user_rating, inclusion: { in: 1..5 }
  validates :place_rating, inclusion: { in: 1..5 }
  validates :comments, presence: true
end
