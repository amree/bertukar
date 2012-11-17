require 'test_helper'

class LocationTest < ActiveSupport::TestCase
  setup do
    @kelantan = locations(:kelantan)
    @kota_bharu = locations(:kota_bharu)
  end

  test "should have nama" do
    @kelantan.nama = nil

    assert @kelantan.invalid?
  end

  test "should have a valid state for a district" do
    @kota_bharu.state_id = 1000

    assert @kota_bharu.invalid?
  end

  test "should have unique district's nama for a district" do
    clone_kota_bharu = Location.new(state_id: @kelantan.id, nama: "Kota Bharu")

    assert clone_kota_bharu.invalid?
  end

  test "should not destroy state with district in it" do
    assert_no_difference('Location.count') do
      @kelantan.destroy
    end
  end

  test "should not destroy location being used by any job" do
    assert_no_difference('Location.count') do
      @kota_bharu.destroy
    end
  end
end