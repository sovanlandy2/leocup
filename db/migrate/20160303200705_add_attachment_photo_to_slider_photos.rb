class AddAttachmentPhotoToSliderPhotos < ActiveRecord::Migration
  def self.up
    change_table :slider_photos do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :slider_photos, :photo
  end
end
