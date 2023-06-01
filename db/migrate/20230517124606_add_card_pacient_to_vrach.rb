class AddCardPacientToVrach < ActiveRecord::Migration[7.0]
  def change
    add_reference :vraches, :card_pacient, null: true, foreign_key: true
  end
end
