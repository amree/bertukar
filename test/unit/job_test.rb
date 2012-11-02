require 'test_helper'

class JobTest < ActiveSupport::TestCase
  setup do
    @offer = jobs(:offer)
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
    @offer.user_id = nil
    assert @offer.invalid?

    @offer.user_id = 0
    assert @offer.invalid?
  end

  test "should fail without a valid location" do
    @offer.location_id = nil
    assert @offer.invalid?

    @offer.location_id = 0
    assert @offer.invalid?
  end

  test "should fail without a ministry" do
    @offer.ministry_id = nil
    assert @offer.invalid?

    @offer.ministry_id = 0
    assert @offer.invalid?
  end

  test "should fail without a valid jawatan" do
    @offer.jawatan = nil
    assert @offer.invalid?

    @offer.jawatan = ""
    assert @offer.invalid?
  end

  test "should fail without gred" do
    @offer.gred = nil

    assert @offer.invalid?
  end

  test "should pass with the correct gred" do
    @offer.gred = "F41"

    assert @offer.valid?
  end

  test "should fail without an expiry date" do
    @offer.expired_at = nil

    assert @offer.invalid?
  end

  test "should fail when expiry date is earlier than the current time" do
    @offer.expired_at = Time.now - 1.day

    assert @offer.invalid?
  end

  test "should fail without nama_organisasi" do
    @offer.nama_organisasi = ""
    assert @offer.invalid?

    @offer.nama_organisasi = nil
    assert @offer.invalid?
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
    assert_equal next_job.jawatan, @current.jawatan
    assert_equal next_job.gred, @current.gred
    assert_equal next_job.expired_at, @current.expired_at

    assert next_job.ministry_id.nil?
    assert next_job.nota.nil?
    assert next_job.nama_organisasi.nil?

    assert next_job.is_exchange
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
