class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :place

  validates :initial_date, presence: true
  validates :final_date, presence: true
end
