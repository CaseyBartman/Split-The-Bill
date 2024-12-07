require "test_helper"

class TripTest < ActiveSupport::TestCase
  setup do
    @trip = Trip.new(name: "Sample?", start_date: Date.new(2024, 12, 1), end_date: Date.new(2024, 12, 30))
  end

  test "valid trip" do
    assert @trip.valid?
  end

  test "invalid without name" do
    @trip.name = nil
    assert_not @trip.valid?
    assert_includes @trip.errors[:name], "can't be blank"
  end

  test "invalid without start date" do
    @trip.start_date = nil
    assert_not @trip.valid?
    assert_includes @trip.errors[:start_date], "can't be blank"
  end

  test "invalid without end date" do
    @trip.end_date = nil
    assert_not @trip.valid?
    assert_includes @trip.errors[:end_date], "can't be blank"
  end
end
