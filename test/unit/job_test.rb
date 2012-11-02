require 'test_helper'

class JobTest < ActiveSupport::TestCase
  setup do
    @current = jobs(:current)
    @next = jobs(:next)
  end

  test "is a current job" do
    assert @current.is_current_job?
  end

  test "is a next job" do
    assert @next.is_next_job?
  end

  test "should fail without a valid user " do
    @current.user_id = nil
    assert @current.invalid?

    @current.user_id = 0
    assert @current.invalid?
  end

  test "should fail without a valid location" do
    @current.location_id = nil
    assert @current.invalid?

    @current.location_id = 0
    assert @current.invalid?
  end

  test "should fail without a ministry" do
    @current.ministry_id = nil
    assert @current.invalid?

    @current.ministry_id = 0
    assert @current.invalid?
  end

  test "should fail without a valid jawatan" do
    @current.jawatan = nil
    assert @current.invalid?

    @current.jawatan = ""
    assert @current.invalid?
  end

  test "should fail without gred" do
    @current.gred = nil

    assert @current.invalid?
  end

  test "should pass with the correct gred" do
    @current.gred = "F41"

    @current.valid?
  end

  test "should fail without nama_organisasi" do
    @current.nama_organisasi = ""
    assert @current.invalid?

    @current.nama_organisasi = nil
    assert @current.invalid?
  end

  test "next job should pass without ministry" do
    @next.ministry_id = nil

    assert @next.valid?
  end

  test "next job should pass without nama organisasi" do
    @next.nama_organisasi = nil

    assert @next.valid?
  end

  test "current job should populate next job automatically" do
    next_job = @current.next_jobs.build
    next_job.location_id = Location.first.id

    @current.save

    assert_equal next_job.user_id, @current.user.id

    assert next_job.ministry_id.nil?
    assert next_job.jawatan.nil?
    assert next_job.gred.nil?
    assert next_job.nota.nil?
    assert next_job.nama_organisasi.nil?
  end

  test "should fail if no next job for exchange" do
    current = @current.dup

    assert current.invalid?
  end

  test "should fail when locations for next job are duplicates" do
    next_job = @current.next_jobs.first.dup
    @current.next_jobs << next_job

    assert next_job.invalid?
  end
end
