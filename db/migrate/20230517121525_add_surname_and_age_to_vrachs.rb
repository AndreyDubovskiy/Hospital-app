class AddSurnameAndAgeToVrachs < ActiveRecord::Migration[7.0]
  def change
    add_column :vraches, :surname, :string
    add_column :vraches, :age, :integer
  end
end
