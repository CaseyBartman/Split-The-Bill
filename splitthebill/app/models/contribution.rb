class Contribution < ApplicationRecord
  belongs_to :expense
  belongs_to :user

  attribute :paid, :boolean, default: false
  validates :amount, numericality: { greater_than_or_equal_to: 0 } #Change this later
end
