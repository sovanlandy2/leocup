class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.integer :region_id
      t.text :description

      t.timestamps null: false
    end
    add_index :teams, :region_id
    add_index :teams, :name
  end
end
