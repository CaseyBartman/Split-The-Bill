class Contribution < ApplicationRecord
  belongs_to :expense
  belongs_to :user

  attribute :paid, :boolean, default: false
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :user_id, presence: true
end
