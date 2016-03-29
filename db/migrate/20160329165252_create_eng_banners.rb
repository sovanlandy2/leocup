class CreateEngBanners < ActiveRecord::Migration
  def change
    create_table :eng_banners do |t|
    	t.text :tag, array: true
      t.integer :order	
      t.text :caption
      t.timestamps null: false
    end
  end
end
