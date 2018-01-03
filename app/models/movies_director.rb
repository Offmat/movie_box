class MoviesDirector < ApplicationRecord
  validates :movie, uniqueness: { scope: :director }
  validates :movie, presence: true
  validates :director, presence: true
  belongs_to :movie
  belongs_to :director

end
