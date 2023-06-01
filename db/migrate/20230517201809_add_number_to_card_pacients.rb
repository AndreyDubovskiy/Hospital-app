class AddNumberToCardPacients < ActiveRecord::Migration[7.0]
  def change
    add_column :card_pacients, :number, :string
  end
end
