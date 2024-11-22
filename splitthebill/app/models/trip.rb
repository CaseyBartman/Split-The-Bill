class Trip < ApplicationRecord
  has_many :participations
  has_many :users, through: :participations
  has_many :expenses

  validates :name, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
end
