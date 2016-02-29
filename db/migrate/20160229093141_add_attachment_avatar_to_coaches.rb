class AddAttachmentAvatarToCoaches < ActiveRecord::Migration
  def self.up
    change_table :coaches do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :coaches, :avatar
  end
end
