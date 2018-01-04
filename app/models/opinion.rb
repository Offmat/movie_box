class Opinion < ApplicationRecord
  validates :score, presence: true, inclusion: 0..10
  validates :movie, uniqueness: { scope: :user }

  belongs_to :movie
  belongs_to :user
end
