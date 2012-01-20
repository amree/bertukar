require 'spec_helper'

describe Location do
  before do
    @location = Factory.build(:location)
  end

  describe "relationship" do
    before do
      @location.save

      @location.districts.build
      @location.districts[0] = Factory.build(:location)
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
      district = Factory(:state_with_district).districts.first
      district.state_id = 1000

      district.should_not be_valid
    end

    it "should have unique nama" do
      @location.save
      location2 = Factory.build(:location, nama: @location.nama)

      location2.should_not be_valid
    end

    it "should have unique nama scoped to state" do
      district1 = Factory(:state_with_district).districts.first
      district2 = Factory.build(:location, state: district1.state, nama: district1.nama)

      district2.should_not be_valid
    end

    it "should not destroy state with district", focus: true do
      state = Factory(:state_with_district)

      expect {
        state.destroy
      }.to change(Location, :count).by(0)
    end
  end
end
