class Movie < ApplicationRecord
  validates :title, presence: true

  has_many :movies_directors, dependent: :destroy
  has_many :directors, through: :movies_directors

  has_many :movies_writers, dependent: :destroy
  has_many :writers, through: :movies_writers

  has_many :opinions
  belongs_to :user

  def genres=(value)
    value = sanitize_genres(value) if value.is_a?(String)
    super(value)
  end

  def countries=(value)
    value = sanitize_countries(value) if value.is_a?(String)
    super(value)
  end

  def duration=(value)
    value = value[0..1].to_i*60 + value[3..4].to_i
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
