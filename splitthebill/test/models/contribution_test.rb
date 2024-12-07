require "test_helper"

class ContributionTest < ActiveSupport::TestCase
  setup do
    @expense = expenses(:dinner)
    @user = users(:casey)
    @contribution = Contribution.new(
      expense: @expense,
      user: @user,
      amount: 50.0,
      paid: false
    )
  end

  test "valid contribution" do
    assert @contribution.valid?
  end

  test "invalid without amount" do
    @contribution.amount = nil
    assert_not @contribution.valid?
    assert_includes @contribution.errors[:amount], "can't be blank"
  end

  test "invalid with negative amount" do
    @contribution.amount = -10
    assert_not @contribution.valid?
    assert_includes @contribution.errors[:amount], "must be greater than or equal to 0"
  end

  test "invalid without user" do
    @contribution.user = nil
    assert_not @contribution.valid?
    assert_includes @contribution.errors[:user_id], "can't be blank"
  end
end
