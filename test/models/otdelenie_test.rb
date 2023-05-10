require "test_helper"

class OtdelenieTest < ActiveSupport::TestCase
  def setup
    @klinika = Klinika.create(name: "Test Klinika", adress: "123 Main St")
    @otdelenie = Otdelenie.create(name: "Test Otdelenie")
    @otdelenie.klinika = @klinika
  end

  test "should be valid" do
    assert @otdelenie.valid?
  end

  test "name should be present" do
    @otdelenie.name = "     "
    assert_not @otdelenie.valid?
  end

  test "should belong to klinika" do
    assert_not_nil @otdelenie.klinika
  end

  test "should have many vraches" do
    assert_respond_to @otdelenie, :vraches
  end
end
