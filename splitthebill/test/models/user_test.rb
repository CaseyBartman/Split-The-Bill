require "test_helper"

class UserTest < ActiveSupport::TestCase
  setup do
    @user = User.new(
      name: "Test User",
      email: "user@example.com",
      password: "password",
      password_confirmation: "password"
    )
  end

  test "valid user" do
    assert @user.valid?
  end

  test "invalid without name" do
    @user.name = nil
    assert_not @user.valid?
    assert_includes @user.errors[:name], "can't be blank"
  end

  test "invalid without email" do
    @user.email = nil
    assert_not @user.valid?
    assert_includes @user.errors[:email], "can't be blank"
  end

  test "invalid with mismatched password confirmation" do
    @user.password_confirmation = "mismatch"
    assert_not @user.valid?
    assert_includes @user.errors[:password_confirmation], "doesn't match Password"
  end
end
