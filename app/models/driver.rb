class Driver < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable

  has_many :routes
  has_many :trips, through: :routes

  validates :name, presence: true
  validates :phone_number, presence: true
end
