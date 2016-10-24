class CreateAutomobiles < ActiveRecord::Migration
  def change
    create_table :automobiles do |t|
      t.string :brand
      t.string :model
      t.string :modification

      t.timestamps null: false
    end
  end
end
