class AddAttachmentImageFileToProperties < ActiveRecord::Migration[5.1]
  def self.up
    change_table :properties do |t|
      t.attachment :image_file
    end
  end

  def self.down
    remove_attachment :properties, :image_file
  end
end
