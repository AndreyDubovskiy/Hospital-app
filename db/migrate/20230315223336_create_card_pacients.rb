class CreateCardPacients < ActiveRecord::Migration[7.0]
  def change
    create_table :card_pacients do |t|
      t.string :adress
      t.string :diagnoz
      t.belongs_to :klinika
      t.timestamps
    end
  end
end
