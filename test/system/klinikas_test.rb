require "application_system_test_case"

class KlinikasTest < ApplicationSystemTestCase
  setup do
    @klinika = klinikas(:one)
  end

  test "visiting the index" do
    visit klinikas_url
    assert_selector "h1", text: "Klinikas"
  end

  test "should create klinika" do
    visit klinikas_url
    click_on "New klinika"

    click_on "Create Klinika"

    assert_text "Klinika was successfully created"
    click_on "Back"
  end

  test "should update Klinika" do
    visit klinika_url(@klinika)
    click_on "Edit this klinika", match: :first

    click_on "Update Klinika"

    assert_text "Klinika was successfully updated"
    click_on "Back"
  end

  test "should destroy Klinika" do
    visit klinika_url(@klinika)
    click_on "Destroy this klinika", match: :first

    assert_text "Klinika was successfully destroyed"
  end
end
