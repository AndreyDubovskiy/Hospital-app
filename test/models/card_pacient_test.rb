require "test_helper"

class CardPacientTest < ActiveSupport::TestCase
  def setup
    @klinika = Klinika.create(name:"TestName", adress: "Test123")
    @card_pacient = CardPacient.new(adress: 'Test Adress', diagnoz: 'Test Diagnoz', klinika: @klinika)
  end

  test 'should be valid' do
    assert @card_pacient.valid?
  end

  test 'adress should be present' do
    @card_pacient.adress = ' '
    assert_not @card_pacient.valid?
  end

  test 'diagnoz should be present' do
    @card_pacient.diagnoz = ' '
    assert_not @card_pacient.valid?
  end

  test 'klinika should be present' do
    @card_pacient.klinika = nil
    assert_not @card_pacient.valid?
  end

  test 'should have one pacient' do
    assert_respond_to @card_pacient, :pacient
  end
end
