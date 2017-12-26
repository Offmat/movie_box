class Writer < ApplicationRecord
  validates :name, uniqueness: { scope: :surname }
  validates :name, presence: true
  validates :surname, presence: true
  has_many :movies_writers
  has_many :writers, through: :movies_writers
end
