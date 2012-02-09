require 'spec_helper'

describe Title do
  before do
    @title = Factory.build(:title)
  end

  describe "validations" do
    describe "nama" do
      it "should not be nil" do
        @title.nama = nil

        @title.should_not be_valid
      end

      it "should be unique" do
        @title.save
        title2 = Factory.build(:title, nama: @title.nama)

        title2.should_not be_valid
      end
    end

    describe "skim" do
      it "should not be nil" do
        @title.skim = nil

        @title.should_not be_valid
      end

      it "should only be letters" do
        @title.skim = "12abc"

        @title.should_not be_valid
      end

      it "should not be more than 2 letters" do
        @title.skim = "abcde"

        @title.should_not be_valid
      end
    end
  end
end