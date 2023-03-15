require "application_system_test_case"

class VrachesTest < ApplicationSystemTestCase
  setup do
    @vrach = vraches(:one)
  end

  test "visiting the index" do
    visit vraches_url
    assert_selector "h1", text: "Vraches"
  end

  test "should create vrach" do
    visit vraches_url
    click_on "New vrach"

    click_on "Create Vrach"

    assert_text "Vrach was successfully created"
    click_on "Back"
  end

  test "should update Vrach" do
    visit vrach_url(@vrach)
    click_on "Edit this vrach", match: :first

    click_on "Update Vrach"

    assert_text "Vrach was successfully updated"
    click_on "Back"
  end

  test "should destroy Vrach" do
    visit vrach_url(@vrach)
    click_on "Destroy this vrach", match: :first

    assert_text "Vrach was successfully destroyed"
  end
end
