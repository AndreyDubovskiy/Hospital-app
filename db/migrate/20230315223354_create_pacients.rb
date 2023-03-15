class CreatePacients < ActiveRecord::Migration[7.0]
  def change
    create_table :pacients do |t|
      t.string :name
      t.belongs_to :card_pacient
      t.timestamps
    end
  end
end
