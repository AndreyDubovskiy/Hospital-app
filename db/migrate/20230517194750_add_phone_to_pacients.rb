class AddPhoneToPacients < ActiveRecord::Migration[7.0]
  def change
    add_column :pacients, :phone, :string
  end
end
