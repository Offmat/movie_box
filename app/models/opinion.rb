class Opinion < ApplicationRecord
  validates :score, presence: true, inclusion: 0..10
  validates :movie, uniqueness: { scope: :user, message: "You can add only one opinion per movie" }

  belongs_to :movie
  belongs_to :user
end
