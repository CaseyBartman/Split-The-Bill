require "test_helper"

class ExpenseTest < ActiveSupport::TestCase
  # setup do
  #   @trip = trips(:one)
  #   @payer = users(:one)
  #   @expense = Expense.new(
  #     trip: @trip,
  #     payer: @payer,
  #     name: "Sample Expense",
  #     amount: 100.0,
  #     date: @trip.start_date
  #   )
  # end

  # test "valid expense" do
  #   assert @expense.valid?
  # end

  # test "invalid without name" do
  #   @expense.name = nil
  #   assert_not @expense.valid?
  #   assert_includes @expense.errors[:name], "can't be blank"
  # end

  # test "invalid with negative amount" do
  #   @expense.amount = -10
  #   assert_not @expense.valid?
  #   assert_includes @expense.errors[:amount], "must be greater than or equal to 0"
  # end

  # test "invalid without date" do
  #   @expense.date = nil
  #   assert_not @expense.valid?
  #   assert_includes @expense.errors[:date], "can't be blank"
  # end

  # test "invalid if date is outside trip range" do
  #   @expense.date = @trip.start_date - 1.day
  #   assert_not @expense.valid?
  #   assert_includes @expense.errors[:date], "must be between the trip's start date"
  # end
end
