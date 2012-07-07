require 'test_helper'

class MinistryTest < ActiveSupport::TestCase

  test "should not be valid without nama" do
    kkm = ministries(:kkm)
    kkm.nama = nil

    assert !kkm.valid?
  end
end