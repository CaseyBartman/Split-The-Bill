class Expense < ApplicationRecord
  belongs_to :trip
  belongs_to :payer, class_name: "User" #the class name part tells rails the payer is a User, not a random reference!
  has_many :contributions, dependent: :destroy
  has_many :users, through: :contributions

  accepts_nested_attributes_for :contributions, allow_destroy: true

  validates :name, presence: true
  validates :amount, numericality: { greater_than_or_equal_to: 0 }
  validates :date, presence: true

  # Custom validation to ensure date falls within trip range!
  validate :date_within_trip_range

  private

  #Also has a custom error message to give the user more info!
  def date_within_trip_range
    if trip.present? && date.present?
      unless date >= trip.start_date && date <= trip.end_date
        errors.add(:date, "must be between the trip's start date (#{trip.start_date}) and end date (#{trip.end_date})")
      end
    end
  end
end
