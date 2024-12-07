require "test_helper"

class ParticipantTest < ActiveSupport::TestCase
  setup do
    @trip = trips(:bahamas)
    @user = users(:new_user) #A user that is not part of the participants.yml for our tests!
    @participant = Participant.new(trip: @trip, user: @user)
  end
  

  test "valid participant" do
    assert @participant.valid?, "Expected participant to be valid with trip and user, but got errors: #{@participant.errors.full_messages}"
  end
  

  test "invalid without trip" do
    @participant.trip = nil
    assert_not @participant.valid?, "Participant should be invalid without a trip"
    assert_includes @participant.errors[:trip], "can't be blank", "Error message for missing trip is incorrect"
  end

  test "invalid without user" do
    @participant.user = nil
    assert_not @participant.valid?, "Participant should be invalid without a user"
    assert_includes @participant.errors[:user], "can't be blank", "Error message for missing user is incorrect"
  end

  test "user and trip pair must be unique" do
    existing_user = users(:krishna) #Already part of bahamas_krishna in participants.yml, so with these we should be invalid!
    existing_trip = trips(:bahamas) #Already part of bahamas_krishna in participants.yml
  
    duplicate_participant = Participant.new(trip: existing_trip, user: existing_user)
  
    assert_not duplicate_participant.valid?, "Participant should be invalid if the trip-user pair is not unique"
    assert_includes duplicate_participant.errors[:user], "has already been taken", "Error message for duplicate participant is incorrect"
  end
  
end
