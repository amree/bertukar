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
end
