class MovieDirector < ApplicationRecord
  validates :movie, uniqueness: { scope: :director }
  belongs_to :movie
  belongs_to :director

end
