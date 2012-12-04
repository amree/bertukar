require 'test_helper'

class Admin::UsersControllerTest < ActionController::TestCase
  def setup
    sign_in users(:admin)

    @user = users(:user)
  end

  test "should get index" do
    get :index

    assert assigns(:users)
    assert assigns(:users).include? @user
  end

  test "should get show" do
    get :show, id: @user.to_param

    assert_equal assigns(:user), @user
  end
end