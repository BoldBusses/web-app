class Ridership < ApplicationRecord
  belongs_to :route
  belongs_to :student

  validates :pickup_time, presence: true
end
