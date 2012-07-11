require 'test_helper'

class TitleTest < ActiveSupport::TestCase
  setup do
    @peg_it = titles(:pegawai_it)
  end

  test "should not have a nil nama" do
    @peg_it.nama = nil

    assert @peg_it.invalid?
  end

  test "should not have a duplicate name" do
    peg_tadbir = titles(:pegawai_tadbir)
    peg_tadbir.nama = @peg_it.nama

    assert @peg_it.invalid?
  end

  test "should save nama in titleize" do
    @peg_it.nama = "nama baru"
    @peg_it.save

    @peg_it.nama == "nama baru".titleize
  end

  test "should not have a nil skim" do
    @peg_it.skim = nil

    assert @peg_it.invalid?
  end

  test "should only be letters in the skim" do
    @peg_it.skim = "1000abc"

    assert @peg_it.invalid?
  end

  test "should not have more than two letters in the skim" do
    @peg_it.skim = "udud"

    assert @peg_it.invalid?
  end

  test "should save skim in uppercase" do
    @peg_it.skim = "ud"
    @peg_it.save

    assert_equal @peg_it.skim, "UD"
  end
end