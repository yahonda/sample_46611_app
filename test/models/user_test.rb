require "test_helper"

class UserTest < ActiveSupport::TestCase
  # Good for Rails 7.0 or older
  test "should not save user without name in tradional way" do
    user = User.new
    error = assert_raises(ActiveRecord::RecordInvalid) do
      user.save!
    end
    assert_equal "Validation failed: Name can't be blank", error.message
  end

  # Good for Rails 7.1 or newer
  test "should not save user without name since Rails 7.1" do
    assert_raises(ActiveRecord::RecordInvalid, match: "Validation failed: Name can't be blank") do
      user = User.new
      user.save!
    end
  end
end
