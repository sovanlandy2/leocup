class CreateContentBlocks < ActiveRecord::Migration
  def change
    create_table :content_blocks do |t|
      t.integer :post_id
      t.text :content

      t.timestamps null: false
    end
  end
end
