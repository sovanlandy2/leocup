class AddAttachmentPhotoToEngBanners < ActiveRecord::Migration
  def self.up
    change_table :eng_banners do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :eng_banners, :photo
  end
end
