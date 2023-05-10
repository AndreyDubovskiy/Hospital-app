require "test_helper"

class CardPacientsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    @user = users(:one)
    @klinika = Klinika.create(name:"TestName", adress: "Test123")
    @card = CardPacient.new(adress: 'Test Adress', diagnoz: 'Test Diagnoz', klinika: @klinika)
    sign_in @user
  end

  test "should get new" do
    get new_card_pacient_url
    assert_response :success
  end

  test "should create card" do
    assert_difference('CardPacient.count') do
      post card_pacients_path, params: { card_pacient: { adress: @card.adress, diagnoz: @card.diagnoz, klinika_id: @card.klinika_id } }
    end
    assert_redirected_to card_pacients_path
  end

  test "should show card" do
    get card_pacients_path, params: { id: @card }
    assert_response :success
  end
end
