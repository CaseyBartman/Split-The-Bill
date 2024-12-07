require "test_helper"

class ExpensesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @trip = trips(:bahamas)  # Assuming trips.yml is set up
    @expense = expenses(:dinner)  # Assuming expenses.yml is set up
  end

  test "should get index" do
    get trip_expenses_url(@trip)  # Use the nested route helper
    assert_response :success
  end

  test "should get new" do
    get new_trip_expense_url(@trip)  # Use the nested route helper
    assert_response :success
  end

  test "should create expense" do
    assert_difference("Expense.count") do
      post trip_expenses_url(@trip), params: { expense: { amount: @expense.amount, date: @expense.date, expense_type: @expense.expense_type, name: @expense.name, payer_id: @expense.payer_id, trip_id: @trip.id } }
    end

    assert_redirected_to trip_expense_url(@trip, Expense.last)  # Use the nested route helper
  end

  test "should show expense" do
    get trip_expense_url(@trip, @expense)  # Use the nested route helper
    assert_response :success
  end

  test "should get edit" do
    get edit_trip_expense_url(@trip, @expense)  # Use the nested route helper
    assert_response :success
  end

  test "should update expense" do
    patch trip_expenses_url(@trip, @expense), params: { expense: { amount: @expense.amount, date: @expense.date, expense_type: @expense.expense_type, name: @expense.name, payer_id: @expense.payer_id, trip_id: @trip.id } }
    assert_redirected_to trip_expense_url(@trip, @expense)  # Use the nested route helper
  end

  test "should destroy expense" do
    assert_difference("Expense.count", -1) do
      delete trip_expense_url(@trip, @expense)  # Use the nested route helper
    end

    assert_redirected_to trip_expenses_url(@trip, @expense)  # Use the nested route helper
  end
end
