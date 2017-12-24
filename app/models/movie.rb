class Movie < ApplicationRecord
validates :title, presence: true

has_many :movies_directors
has_many :directors, through: :movies_directors

has_many :movies_writers
has_many :writers, through: :movies_writers


  def genres=(value)
    value = sanitize_genres(value) if value.is_a?(String)
    super(value)
  end

  private

  def sanitize_genres(value)
    value.downcase.split.uniq
  end
end
