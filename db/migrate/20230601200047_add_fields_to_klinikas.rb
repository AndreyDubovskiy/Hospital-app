class AddFieldsToKlinikas < ActiveRecord::Migration[7.0]
  def change
    add_column :klinikas, :type, :string
    add_column :klinikas, :city, :string
    add_column :klinikas, :RatingMortality, :string
  end
end
