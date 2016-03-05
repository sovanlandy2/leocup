class AddAttachmentPhotoToPosts < ActiveRecord::Migration
  def self.up
    change_table :post_photos do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :post_photos, :photo
  end
end
