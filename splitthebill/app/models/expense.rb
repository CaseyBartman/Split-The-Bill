class Expense < ApplicationRecord
  belongs_to :trip
  belongs_to :payer, class_name: "User" #the class name part tells rails the payer is a User, not a random reference!
  has_many :contributions, dependent: :destroy
  has_many :users, through: :contributions

  validates :name, presence: true
  validates :amount, numericality: { greater_than_or_equal_to: 0 }
  validates :date, presence: true
end
