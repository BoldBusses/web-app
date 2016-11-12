class Guardian < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable

  has_many :guardian_students
  has_many :students, through: :guardian_students

  validates :name, presence: true
end
