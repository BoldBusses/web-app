class BoardingAction < ApplicationRecord
  belongs_to :student
  belongs_to :trip

  validates :boarded_at, presence: true
  validates :onboard, presence: true
end
