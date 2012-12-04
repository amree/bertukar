require 'test_helper'

class Admin::LocationsControllerTest < ActionController::TestCase
  setup do
    sign_in users(:admin)

    @location = locations(:kelantan)
    @kb = locations(:kota_bharu)
    @pmas = locations(:pasir_mas)

    @valid_data = { "nama" => "Pahang" }
  end

  test "should get index" do
    get :index

    assert assigns(:locations)
    assert assigns(:locations).include? @location
  end

  test "should get new" do
    get :new

    assert assigns(:location).new_record?
  end

  test "POST create new location" do
    assert_difference("Location.count") do
      post :create, location: @valid_data
    end
  end

  test "should get show" do
    get :show, id: @location.to_param

    assert_equal assigns(:location), @location
  end

  test "should get edit" do
    get :show, id: @location.to_param

    assert_equal assigns(:location), @location
  end

  test "POST assigns a new created" do
    post :create, location: @valid_data

    assert assigns(:location).persisted?
  end

  test "POST redirects to the last current created location" do
    post :create, location: @valid_data

    assert_redirected_to admin_location_path(Location.unscoped.last)
  end

  test "PUT assigns the correct location" do
    put :update, { id: @location.to_param, location: @location.attributes }

    assert_equal assigns(:location), @location
  end

  test "PUT redirects to the ministry after update" do
    put :update, { id: @location.to_param, location: @location.attributes }

    assert_redirected_to admin_location_path(@location)
  end

  test "DELETE destroy" do
    assert_difference("Location.count", -1) do
      delete :destroy, id: @pmas.to_param
    end
  end

  test "DELETE redirect to locations list" do
    delete :destroy, id: @pmas.to_param

    assert_redirected_to admin_locations_url
  end

  test "DELETE state in use should fail" do
    delete :destroy, id: @location.to_param

    assert_redirected_to [:admin, @location]
  end

  test "DELETE location in use should fail" do
    assert_difference("Location.count", 0) do
      delete :destroy, id: @kb.to_param
    end

    assert_redirected_to [:admin, @kb]
  end
end