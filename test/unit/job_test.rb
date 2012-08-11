require 'test_helper'

class JobTest < ActiveSupport::TestCase
  setup do
    @job_offer = jobs(:offer)
    @job_current = jobs(:current)
  end

  test "should fail without a valid user " do
    @job_offer.user_id = nil
    assert @job_offer.invalid?

    @job_offer.user_id = 1000
    assert @job_offer.invalid?
  end

  test "should fail without a valid location" do
    @job_offer.location_id = nil
    assert @job_offer.invalid?

    @job_offer.location_id = 1000
    assert @job_offer.invalid?
  end

  test "should fail without a valid title" do
    @job_offer.title_id = nil
    assert @job_offer.invalid?

    @job_offer.title_id = 1000
    assert @job_offer.invalid?
  end

  test "should fail without gred" do
    @job_offer.gred = nil

    assert @job_offer.invalid?
  end

  test "should fail without an expiry date" do
    @job_offer.expired_at = nil

    assert @job_offer.invalid?
  end

  test "should fail when expiry date is earlier than the current time" do
    @job_offer.expired_at = Time.now - 1.day

    assert @job_offer.invalid?
  end

  test "should fail with incorrect gred's format" do
    @job_offer.gred = "F41"

    assert @job_offer.invalid?
  end

  test "should fail when gred's value < 0" do
    @job_offer.gred = -1

    assert @job_offer.invalid?
  end

  test "should fail when gred's value > 54" do
    @job_offer.gred = 55

    assert @job_offer.invalid?
  end

  test "should fail without a valid ministry" do
    @job_offer.ministry_id = 1000
    assert @job_offer.invalid?

    @job_offer.ministry_id = nil
    assert @job_offer.invalid?
  end

  test "should fail without nama_organisasi" do
    @job_offer.nama_organisasi = ""
    assert @job_offer.invalid?

    @job_offer.nama_organisasi = nil
    assert @job_offer.invalid?
  end

  test "next job should pass without ministry" do
    next_job = @job_current.next_jobs.build
    next_job.location_id = @job_current.location_id
    next_job.ministry_id = nil

    assert @job_current.valid?
  end

  test "current job should populate next job automatically" do
    @job_current.next_jobs.build
    @job_current.save

    assert @job_current.next_jobs.last.user_id == @job_current.user_id
    assert @job_current.next_jobs.last.title_id == @job_current.title_id
    assert @job_current.next_jobs.last.gred == @job_current.gred
    assert @job_current.next_jobs.last.expired_at == @job_current.expired_at
    assert @job_current.next_jobs.last.is_exchange
  end

  test "offer/current job should fail without nama organisasi" do
    @job_offer.nama_organisasi = nil
    assert @job_offer.invalid?

    @job_current.nama_organisasi = nil
    assert @job_current.invalid?
  end
end