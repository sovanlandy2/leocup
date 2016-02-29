class CreateRegions < ActiveRecord::Migration
  def change
    create_table :regions do |t|
      t.string :name

      t.timestamps null: false
    end
    add_index :regions, :name
  end
end
