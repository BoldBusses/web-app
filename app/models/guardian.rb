class Guardian < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable

  has_many :guardians_students
  has_many :students, through: :guardians_students

  validates :name, presence: true
end
