require 'test_helper'

class MinistryTest < ActiveSupport::TestCase
  setup do
    @kkm = ministries(:kkm)
  end

  test "should not be valid without nama" do
    @kkm.nama = nil

    assert @kkm.invalid?
  end

  test "should not be valid without a unique name" do
    kpt = ministries(:kpt)
    kpt.nama = @kkm.nama

    assert kpt.invalid?
  end

  test "should be active by default" do
    assert @kkm.is_aktif
  end

  test "should have name in TitleCase" do
    title = "Nama baru kkm"
    @kkm.nama = title
    @kkm.save

    assert_equal @kkm.nama, title.titleize
  end

  test "should not delete ministry in use" do
    assert !@kkm.destroy
  end
end