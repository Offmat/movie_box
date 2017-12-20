class Movie < ApplicationRecord
  has_many :directors
  has_many :writers

  def genres=(value)
    value = sanitize_genres(value) if value.is_a?(String)
    super(value)
  end

  private

  def sanitize_genres(value)
    value.titleize.split.uniq
  end
end
