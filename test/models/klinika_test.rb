require "test_helper"

class KlinikaTest < ActiveSupport::TestCase
  test "should not save klinika without name" do
    klinika = Klinika.new(adress: "123 Main St")
    assert_not klinika.save, "Saved klinika without a name"
  end

  test "should not save klinika without adress" do
    klinika = Klinika.new(name: "Test Klinika")
    assert_not klinika.save, "Saved klinika without an adress"
  end

  test "should save klinika with name and adress" do
    klinika = Klinika.new(name: "Test Klinika", adress: "123 Main St")
    assert klinika.save, "Could not save valid klinika"
  end

  test "should have many otdelenies" do
    klinika = Klinika.new(name: "Test Klinika", adress: "123 Main St")
    assert_respond_to klinika, :otdelenies, "Klinika does not have otdelenies association"
  end

  test "should have many card_pacients" do
    klinika = Klinika.new(name: "Test Klinika", adress: "123 Main St")
    assert_respond_to klinika, :card_pacients, "Klinika does not have card_pacients association"
  end
end
