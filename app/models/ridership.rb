class Ridership < ApplicationRecord
  belongs_to :route
  belongs_to :student

  validates :pickup_time, presence: true

  def self.ordered_by_pickup_time
    order(:pickup_time)
  end
end
