class Movie < ApplicationRecord
validates :title, presence: true

has_many :movies_directors, dependent: :destroy
has_many :directors, through: :movies_directors

has_many :movies_writers, dependent: :destroy
has_many :writers, through: :movies_writers


  def genres=(value)
    value = sanitize_genres(value) if value.is_a?(String)
    super(value)
  end

  def countries=(value)
    value = sanitize_countries(value) if value.is_a?(String)
    super(value)
  end

  private

  def sanitize_genres(value)
    value.downcase.tr(",", " ").split.uniq
  end

  def sanitize_countries(value)
    value.titleize.tr(",", " ").split.uniq
  end
end
