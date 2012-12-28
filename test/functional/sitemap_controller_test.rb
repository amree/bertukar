require 'test_helper'

class SitemapControllerTest < ActionController::TestCase
  test "should get index" do
    get :index

    assert assigns(:pages_to_visit)
  end
end