class CreateAutos < ActiveRecord::Migration
  def change
    create_table :autos do |t|
      t.string :brand
      t.string :model
      t.string :modification

      t.timestamps null: false
    end
  end
end
