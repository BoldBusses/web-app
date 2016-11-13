class Trip < ApplicationRecord
  has_many :boarding_actions
  belongs_to :route

  def finished?
    ended_at
  end

  def in_progress?
    ended_at.blank?
  end

  def status
    if ended_at.present?
      "Finished"
    else
      "En route"
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
