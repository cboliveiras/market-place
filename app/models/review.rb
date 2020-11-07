class Review < ApplicationRecord
  after_create :calculate_average

  belongs_to :user
  belongs_to :place

  validates :user_rating, inclusion: { in: 1..5 }
  validates :place_rating, inclusion: { in: 1..5 }
  validates :user_rating, presence: true
  validates :place_rating, presence: true
  validates :comments, presence: true

  private

  def calculate_average

    count = place.reviews.count
    avg = if count.zero?
            0
          else
            place.reviews.sum(:place_rating) / count
          end

    place.place_avg_review = avg
    place.save(validate: false)
  end
end
