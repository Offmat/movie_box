class Director < ApplicationRecord
  validates :name, uniqueness: { scope: :surname }
  validates :name, presence: true
  validates :surname, presence: true
  has_many :movies_directors
  has_many :directors, through: :movies_directors
end
