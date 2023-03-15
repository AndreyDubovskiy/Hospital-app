class CreateVraches < ActiveRecord::Migration[7.0]
  def change
    create_table :vraches do |t|
      t.string :name
      t.belongs_to :otdelenie
      t.belongs_to :special
      t.timestamps
    end
  end
end
