class MoviesWriter < ApplicationRecord
  validates :movie, uniqueness: { scope: :writer }
  belongs_to :movie
  belongs_to :writer

end
