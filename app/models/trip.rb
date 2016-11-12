class Trip < ApplicationRecord
  belongs_to :route

  def status
    if ended_at.present?
      "Finished"
    else
      "In progress"
    end
  end

  def self.finished
    where.not(ended_at: nil)
  end

  def self.in_progress
    where(ended_at: nil)
  end

  def self.ordered_by_start_at
    order(start_at: :desc)
  end
end
