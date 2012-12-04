require 'test_helper'

class Admin::JobsControllerTest < ActionController::TestCase
  def setup
    sign_in users(:admin)

    @current = jobs(:current)
  end

  test "should get index" do
    get :index

    assert assigns(:jobs)
    assert assigns(:jobs).include? @current
  end

  test "should get show" do
    get :show, id: @current.to_param

    assert_equal assigns(:job), @current
  end
end