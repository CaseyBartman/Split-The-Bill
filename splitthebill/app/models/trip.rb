class Trip < ApplicationRecord
  has_many :participants
  has_many :users, through: :participants
  has_many :expenses

  validates :name, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
end
