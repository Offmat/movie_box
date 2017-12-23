class Director < ApplicationRecord
  validates :name, uniqueness: { scope: :surname }
  has_many :movies_directors
  has_many :directors, through: :movies_directors
end
