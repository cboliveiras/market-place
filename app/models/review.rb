class Review < ApplicationRecord
  belongs_to :user
  belongs_to :place

  validates :user_rating, inclusion: { in: 0..5 }
  validates :place_rating, inclusion: { in: 0..5 }
  validates :content, presence: true
end
