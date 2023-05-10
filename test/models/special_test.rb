require "test_helper"

class SpecialTest < ActiveSupport::TestCase
  test "should not save special without name" do
    special = Special.new
    assert_not special.save, "Saved the special without a name"
  end

  test "should save special with name" do
    special = Special.new(name: "Cardiology")
    assert special.save, "Failed to save the special with a name"
  end

  test "should have many vraches" do
    special = Special.reflect_on_association(:vraches)
    assert_equal :has_many, special.macro
  end
end
