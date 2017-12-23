class Movie < ApplicationRecord
validates :title, presence: true

has_many :movies_directors
has_many :directors, through: :movies_directors


  def genres=(value)
    value = sanitize_genres(value) if value.is_a?(String)
    super(value)
  end

  private

  def sanitize_genres(value)
    value.titleize.split.uniq
  end
end
