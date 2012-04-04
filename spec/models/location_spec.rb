require 'spec_helper'

describe Location do
  before do
    @location = FactoryGirl.build(:location)
  end

  describe "relationship" do
    before do
      @location.save

      @location.districts.build
      @location.districts[0] = FactoryGirl.build(:location)
      @location.save
    end

    it "state should save districts correctly" do
      @location.districts.count.should eql(1)
    end

    it "district should get state correctly" do
      district = @location.districts.first

      district.state.should_not be_nil
    end
  end

  describe "validations" do
    it "should have nama" do
      @location.nama = nil

      @location.should_not be_valid
    end

    it "should not have a valid state for a district" do
      district = FactoryGirl.create(:state_with_district).districts.first
      district.state_id = 1000

      district.should_not be_valid
    end

    it "should have unique nama" do
      @location.save
      location2 = FactoryGirl.build(:location, nama: @location.nama)

      location2.should_not be_valid
    end

    it "should have unique nama scoped to state" do
      district1 = FactoryGirl.create(:state_with_district).districts.first
      district2 = FactoryGirl.build(:location, state: district1.state, nama: district1.nama)

      district2.should_not be_valid
    end

    it "should not destroy state with district" do
      state = FactoryGirl.create(:state_with_district)

      expect {
        state.destroy
      }.to change(Location, :count).by(0)
    end
  end
end
