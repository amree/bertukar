require 'spec_helper'

describe Job do
  it "should have 2 jenis" do
    Job::JENIS.count.should eq(2)
  end
end
