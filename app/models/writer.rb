class Writer < ApplicationRecord
  validates :name, uniqueness: { scope: :surname }
  has_many :movies_writers
  has_many :writers, through: :movies_writers
end
