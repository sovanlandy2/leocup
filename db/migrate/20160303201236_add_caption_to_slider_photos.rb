class AddCaptionToSliderPhotos < ActiveRecord::Migration
  def change
    add_column :slider_photos, :caption, :text
  end
end
