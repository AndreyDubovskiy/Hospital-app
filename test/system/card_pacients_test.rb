require "application_system_test_case"

class CardPacientsTest < ApplicationSystemTestCase
  setup do
    @card_pacient = card_pacients(:one)
  end

  test "visiting the index" do
    visit card_pacients_url
    assert_selector "h1", text: "Card pacients"
  end

  test "should create card pacient" do
    visit card_pacients_url
    click_on "New card pacient"

    click_on "Create Card pacient"

    assert_text "Card pacient was successfully created"
    click_on "Back"
  end

  test "should update Card pacient" do
    visit card_pacient_url(@card_pacient)
    click_on "Edit this card pacient", match: :first

    click_on "Update Card pacient"

    assert_text "Card pacient was successfully updated"
    click_on "Back"
  end

  test "should destroy Card pacient" do
    visit card_pacient_url(@card_pacient)
    click_on "Destroy this card pacient", match: :first

    assert_text "Card pacient was successfully destroyed"
  end
end
