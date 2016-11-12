class Student < ApplicationRecord
  has_many :boarding_actions
  has_many :trips, through: :boarding_actions
  has_many :riderships

  validates :name, presence: true
  validates :street_address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zipcode, presence: true
end
