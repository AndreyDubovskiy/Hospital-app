class AddVrachToCardPacients < ActiveRecord::Migration[7.0]
  def change
    add_reference :card_pacients, :vrach, null: true, foreign_key: true
  end
end
