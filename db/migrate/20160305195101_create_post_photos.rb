class CreatePostPhotos < ActiveRecord::Migration
  def change
    create_table :post_photos do |t|
      t.integer :post_id

      t.timestamps null: false
    end
    add_index :post_photos , :post_id
  end
end
