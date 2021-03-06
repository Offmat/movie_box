class Writer < ApplicationRecord
  validates :name, uniqueness: { scope: :surname }
  validates :name, presence: true
  validates :surname, presence: true
  has_many :movies_writers
  has_many :movies, through: :movies_writers

  def full_name
    "#{name} #{surname}"
  end
end
