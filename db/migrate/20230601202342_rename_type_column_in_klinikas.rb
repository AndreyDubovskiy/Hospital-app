class RenameTypeColumnInKlinikas < ActiveRecord::Migration[7.0]
  def change
    rename_column :klinikas, :type, :typeHospital
  end
end
