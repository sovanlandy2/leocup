class CreateTournaments < ActiveRecord::Migration
  def change
    create_table :tournaments do |t|
      t.string :name
      t.boolean :visible, default: true

      t.timestamps null: false
    end
    add_index :tournaments, :name
  end
end
