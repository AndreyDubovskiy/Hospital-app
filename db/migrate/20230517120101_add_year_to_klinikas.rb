class AddYearToKlinikas < ActiveRecord::Migration[7.0]
  def change
    add_column :klinikas, :year, :integer
  end
end
