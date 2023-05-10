require "test_helper"

class PacientTest < ActiveSupport::TestCase
  def setup
    @card_pacient = CardPacient.create(adress: '123456', diagnoz: "afas", klinika: Klinika.new(name:"TestName", adress: "Test123"))
    @pacient = Pacient.new(name: 'John Doe', card_pacient: @card_pacient)
  end

  test 'should be valid' do
    assert @pacient.valid?
  end

  test 'name should be present' do
    @pacient.name = ''
    assert_not @pacient.valid?
  end

  test 'should belong to card_pacient' do
    assert_equal @pacient.card_pacient, @card_pacient
  end
end
