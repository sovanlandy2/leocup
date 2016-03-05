class CreateGalleryPhotos < ActiveRecord::Migration
  def change
    create_table :gallery_photos do |t|
      t.integer :team_left_id
      t.integer :team_right_id

      t.timestamps null: false
    end
    add_index :gallery_photos, :team_right_id
    add_index :gallery_photos, :team_left_id
  end
end
