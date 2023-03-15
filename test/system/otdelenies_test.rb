require "application_system_test_case"

class OtdeleniesTest < ApplicationSystemTestCase
  setup do
    @otdeleny = otdelenies(:one)
  end

  test "visiting the index" do
    visit otdelenies_url
    assert_selector "h1", text: "Otdelenies"
  end

  test "should create otdeleny" do
    visit otdelenies_url
    click_on "New otdeleny"

    click_on "Create Otdeleny"

    assert_text "Otdeleny was successfully created"
    click_on "Back"
  end

  test "should update Otdeleny" do
    visit otdeleny_url(@otdeleny)
    click_on "Edit this otdeleny", match: :first

    click_on "Update Otdeleny"

    assert_text "Otdeleny was successfully updated"
    click_on "Back"
  end

  test "should destroy Otdeleny" do
    visit otdeleny_url(@otdeleny)
    click_on "Destroy this otdeleny", match: :first

    assert_text "Otdeleny was successfully destroyed"
  end
end
