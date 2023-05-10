require "test_helper"

class VrachTest < ActiveSupport::TestCase
  def setup
    @special = Special.create(name: "Test Special")
    @otdelenie = Otdelenie.create(name: "Test Otdelenie", klinika: Klinika.create(name: "Test Klinika", adress: "Test adres"))
    @vrach = Vrach.new(name: "Test Vrach", special: @special, otdelenie: @otdelenie)
  end

  test "valid vrach should be valid" do
    assert @vrach.valid?
  end

  test "vrach name should be present" do
    @vrach.name = ""
    assert_not @vrach.valid?
  end

  test "vrach should belong to a special" do
    @vrach.special = nil
    assert_not @vrach.valid?
  end

  test "vrach should belong to an otdelenie" do
    @vrach.otdelenie = nil
    assert_not @vrach.valid?
  end
end
