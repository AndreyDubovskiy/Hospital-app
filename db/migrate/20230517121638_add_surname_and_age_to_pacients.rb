class AddSurnameAndAgeToPacients < ActiveRecord::Migration[7.0]
  def change
    add_column :pacients, :surname, :string
    add_column :pacients, :age, :integer
  end
end
