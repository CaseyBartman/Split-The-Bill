class Expense < ApplicationRecord
  has_many :contributions, dependent: :destroy
  belongs_to :trip
  belongs_to :payer #more detail here?

  validates :name, presence: true
  validates :amount, numericality: { greater_than_or_equal_to: 0 }
  validates :date, presence: true
end
