class Participant < ApplicationRecord
  belongs_to :trip
  belongs_to :user

  validates :trip, presence: true
  validates :user, presence: true
  validates :user, uniqueness: { scope: :trip, message: "has already been taken" }
end
