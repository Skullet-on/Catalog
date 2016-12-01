class AddAttachmentImageToAutomobiles < ActiveRecord::Migration
  def self.up
    change_table :automobiles do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :automobiles, :image
  end
end
