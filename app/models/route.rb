class Route < ApplicationRecord
  belongs_to :driver

  has_many :riderships
  has_many :students, through: :riderships
  has_many :trips

  validates :name, presence: true
end
