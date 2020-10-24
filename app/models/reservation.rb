class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :place
  has_one :user, through: :places
end
