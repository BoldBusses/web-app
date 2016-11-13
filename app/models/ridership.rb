class Ridership < ApplicationRecord
  belongs_to :route
  belongs_to :student

  validates :pickup_time, presence: true

  def status_for_trip(trip)
    boarding_action = BoardingAction.where(student: student, trip: trip).first
    if boarding_action.present? && boarding_action.onboard?
      "onboard"
    elsif boarding_action.present?
      "absent"
    else
      "pending"
    end
  end

  def self.ordered_by_pickup_time
    order(:pickup_time)
  end

  def self.with_status_for_trip(status, trip)
    all.to_a.select do |ridership|
      ridership.status_for_trip(trip) == status
    end
  end
end
