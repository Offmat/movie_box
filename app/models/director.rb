class Director < ApplicationRecord
  validates :name, uniqueness: { scope: :surname }
  has_many :movie_directors
  has_many :directors, through: :movie_directors
end
