require 'test_helper'

class ListingsControllerTest < ActionController::TestCase
  setup do
    @kelantan = locations(:kelantan)
  end

  test "should get state" do
    get :states, id: @kelantan.to_param
  end
end