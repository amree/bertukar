require 'test_helper'

class JobsControllerTest < ActionController::TestCase
  setup do
    sign_in users(:user)

    @current = jobs(:current)

    dup = @current.dup

    @valid_data = {
      "location_id" => dup.location_id,
      "ministry_id" => dup.ministry_id,
      "nama_organisasi" => "JPA",
      "gred" => "F41",
      "jawatan" => "Pegawai",
      "nota" => "Blah blah",
      "next_jobs_attributes" => {
        "0" => {"location_id" => dup.location_id, "_destroy" => "false"}}}
  end

  test "should get index" do
    get :index
    assert assigns(:jobs)
    assert assigns(:jobs).include? @current
  end

  test "should get new" do
    get :new

    assert assigns(:job).new_record?
  end

  test "POST create new job" do
    assert_difference("Job.count", 2) do
      post :create, { job: @valid_data }
    end
  end

  test "should get show" do
    get :show, { id: @current.to_param }
    assert_equal assigns(:job), @current
  end

  test "should get edit" do
    get :edit, id: @current.to_param

    assert_equal assigns(:job), @current
  end

  test "POST assigns a new created" do
    post :create, { job: @valid_data }

    assert assigns(:job).persisted?
  end

  test "POST redirects to the last current created job" do
    post :create, { job: @valid_data }

    assert_redirected_to job_path(Job.last.current_job)
  end

  # test "POST with invalid params" do
  #   Job.any_instance.stubs(:save).returns(false)

  #   post :create, job: {}

  #   assert assigns(:job).new_record?
  # end

  #test "POST with invalid params should re-renders the 'new' template" do
    #Job.any_instance.stubs(:save).returns(false)

    #post :create, job: {}

    #assert_template 'new'
  #end

  #test "PUT update job" do
    #Job.any_instance.expects(:update_attributes).with(paramify_values(@current.attributes))

    #put :update, {id: @current.to_param, job: @current.attributes}
  #end

  test "PUT assigns the correct job" do
    put :update, {id: @current.to_param, job: @current.attributes }

    assert_equal assigns(:job), @current
  end

  test "PUT redirects to the job after update" do
    put :update, {id: @current.to_param, job: @current.attributes }

    assert_redirected_to job_path(@current)
  end

  #test "PUT with invalid params" do
    #Job.any_instance.stubs(:save).returns(false)

    #put :update, {id: @current.to_param, job: {}}

    #assert_equal assigns(:job), @current
  #end

  #test "PUT with invalid params should re-renders the 'edit' template" do
    #Job.any_instance.stubs(:save).returns(false)

    #put :update, {id: @current.to_param, job: @current.attributes}

    #assert_template 'edit'
  #end

  test "DELETE destroy" do
    assert_difference("Job.count", -2) do
      delete :destroy, id: @current.to_param
    end
  end

  test "DELETE redirect to jobs list" do
    delete :destroy, id: @current.to_param

    assert_redirected_to jobs_url
  end
end
