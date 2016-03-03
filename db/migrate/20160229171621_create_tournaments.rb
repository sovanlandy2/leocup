class CreateTournaments < ActiveRecord::Migration
  def change
    create_table :tournaments do |t|
      t.string :name
      t.boolean :visible, default: true
      t.date :start_date
      t.date :end_date
      t.string :location

      t.timestamps null: false
    end
    add_index :tournaments, :name
  end
end
