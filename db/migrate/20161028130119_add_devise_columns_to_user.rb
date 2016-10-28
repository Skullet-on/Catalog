class AddDeviseColumnsToUser < ActiveRecord::Migration
  def self.up
    add_column    :users, :name,    :string
    add_column    :users, :admin,   :boolean, null: false, default: false

    add_index     :users, :name
    add_index     :users, :admin
  end
  def self.down
    remove_column   :users, :name,    :string
    remove_column   :users, :admin,   :boolean
  end
end
