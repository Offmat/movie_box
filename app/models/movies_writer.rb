class MoviesWriter < ApplicationRecord
  validates :movie, uniqueness: { scope: :writer }
  validates :movie, presence: true
  validates :writer, presence: true
  belongs_to :movie
  belongs_to :writer

end
