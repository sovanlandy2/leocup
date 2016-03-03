class CreateSliderPhotos < ActiveRecord::Migration
  def change
    create_table :slider_photos do |t|
      t.text :tag, array: true
      t.integer :order
      t.timestamps null: false
    end
  end
end
