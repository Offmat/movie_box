class Movie < ApplicationRecord


  def genres=(value)
    value = sanitize_genres(value) if value.is_a?(String)
    super(value)
  end

  private

  def sanitize_genres(value)
    value.titleize.split.uniq
  end
end
