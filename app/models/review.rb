class Review < ApplicationRecord
  belongs_to :user
  belongs_to :place
  has_one :user, through: :places

  validates :user_rating, inclusion: { in: 0..5 }
  validates :place_rating, inclusion: { in: 0..5 }
  validates :content, presence: true
end
