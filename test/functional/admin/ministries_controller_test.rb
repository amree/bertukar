require 'test_helper'

class Admin::MinistriesControllerTest < ActionController::TestCase
  setup do
    sign_in users(:admin)

    @ministry = ministries(:kkm)
    @kpt = ministries(:kpt)

    @valid_data = { "nama" => "Kementerian", "is_aktif" => true }
  end

  test "should get index" do
    get :index

    assert assigns(:ministries)
    assert assigns(:ministries).include? @ministry
  end

  test "should get new" do
    get :new

    assert assigns(:ministry).new_record?
  end

  test "POST create new ministry" do
    assert_difference("Ministry.count") do
      post :create, { ministry: @valid_data }
    end
  end

  test "should get show" do
    get :show, { id: @ministry.to_param }

    assert_equal assigns(:ministry), @ministry
  end

  test "should get edit" do
    get :edit, id: @ministry.to_param

    assert_equal assigns(:ministry), @ministry
  end

  test "POST assigns a new created" do
    post :create, { ministry: @valid_data }

    assert assigns(:ministry).persisted?
  end

  test "POST redirects to the last current created ministry" do
    post :create, { ministry: @valid_data }

    assert_redirected_to admin_ministry_path(Ministry.last)
  end

  test "PUT assigns the correct job" do
    put :update, { id: @ministry.to_param, ministry: @ministry.attributes }

    assert_equal assigns(:ministry), @ministry
  end

  test "PUT redirects to the ministry after update" do
    put :update, { id: @ministry.to_param, ministry: @ministry.attributes }

    assert_redirected_to admin_ministry_path(@ministry)
  end

  test "DELETE destroy" do
    assert_difference("Ministry.count", -1) do
      delete :destroy, id: @kpt.to_param
    end
  end

  test "DELETE redirect to ministries list" do
    delete :destroy, id: @kpt.to_param

    assert_redirected_to admin_ministries_url
  end

  test "DELETE ministry in use should fail" do
    delete :destroy, id: @ministry.to_param

    assert_redirected_to [:admin, @ministry]
  end
end