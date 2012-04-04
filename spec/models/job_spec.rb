require 'spec_helper'

describe Job do
  before do
    @job = FactoryGirl.build(:job)
  end

  context "exchange and non exchange" do
    describe "validations" do
      it "should fail without a valid user" do
        @job.user_id = 1000

        @job.should_not be_valid
      end

      it "should fail without a valid location" do
        @job.location_id = 1000

        @job.should_not be_valid
      end

      it "should fail without a valid title" do
        @job.title_id = 1000

        @job.should_not be_valid
      end

      it "should fail without a gred" do
        @job.gred = nil

        @job.should_not be_valid
      end

      it "should fail without an expiry date" do
        @job.expired_at = nil

        @job.should_not be_valid
      end

      it "should fail when expiry date is earlier than current time" do
        @job.expired_at = Time.now

        @job.should_not be_valid
      end

      it "should fail without the correct gred's format" do
        @job.gred = "F41"

        @job.should_not be_valid
      end

      it "should fail when value < 0" do
        @job.gred = -1

        @job.should_not be_valid
      end

      it "should fail when value > 54" do
        @job.gred = 55

        @job.should_not be_valid
      end
    end
  end

  context "exchange" do
    before do
      @job.is_exchange = true
    end

    describe "validations" do
      it "should fail without a valid ministry" do
        @job.ministry_id = 1000

        @job.save.should_not be_true
      end

      it "should fail without nama organisasi" do
        @job.nama_organisasi = nil

        @job.save.should_not be_true
      end
    end

    context "next jobs" do
      describe "validations" do
        it "should pass without ministry" do
          @job.next_jobs.build
          @job.next_jobs.first.location_id = @job.location_id

          @job.save.should be_true
        end
      end

      describe "auto populate" do
        it "should set children's values" do
          @job.next_jobs.build
          @job.save

          @job.next_jobs.first.user_id.should eq(@job.user_id)
          @job.next_jobs.first.title_id.should eq(@job.title_id)
          @job.next_jobs.first.gred.should eq(@job.gred)
          @job.next_jobs.first.expired_at.should eq(@job.expired_at)
          @job.next_jobs.first.is_exchange.should be_true
        end
      end
    end
  end

  context "non exchange" do
    describe "validations" do
      it "should fail with a current job" do
        @job.save

        job = FactoryGirl.build(:job, job_id: @job)
        job.is_exchange = false

        job.should_not be_valid
      end

      it "should fail without nama organisasi" do
        @job.nama_organisasi = nil

        @job.should_not be_valid
      end
    end
  end

  it "should return the correct state id" do
    state = FactoryGirl.create(:location)
    district = FactoryGirl.create(:location, state_id: state.id)

    @job.location_id = district.id
    @job.save

    @job.get_state.should eql(state.id)
  end

  it "should return the same location if it's already a state" do
    @job.save

    @job.get_state.should eql(@job.location_id)
  end
end
