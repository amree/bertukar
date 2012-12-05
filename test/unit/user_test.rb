require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @user = users(:user)
  end

  test "deleting a user should delete its job" do
    assert_difference("Job.count", -2) do
      @user.destroy
    end
  end
end
