require "test_helper"

class CardPacientsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @card_pacient = card_pacients(:one)
  end

  test "should get index" do
    get card_pacients_url
    assert_response :success
  end

  test "should get new" do
    get new_card_pacient_url
    assert_response :success
  end

  test "should create card_pacient" do
    assert_difference("CardPacient.count") do
      post card_pacients_url, params: { card_pacient: {  } }
    end

    assert_redirected_to card_pacient_url(CardPacient.last)
  end

  test "should show card_pacient" do
    get card_pacient_url(@card_pacient)
    assert_response :success
  end

  test "should get edit" do
    get edit_card_pacient_url(@card_pacient)
    assert_response :success
  end

  test "should update card_pacient" do
    patch card_pacient_url(@card_pacient), params: { card_pacient: {  } }
    assert_redirected_to card_pacient_url(@card_pacient)
  end

  test "should destroy card_pacient" do
    assert_difference("CardPacient.count", -1) do
      delete card_pacient_url(@card_pacient)
    end

    assert_redirected_to card_pacients_url
  end
end
