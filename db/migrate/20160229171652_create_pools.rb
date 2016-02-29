class CreatePools < ActiveRecord::Migration
  def change
    create_table :pools do |t|
      t.string :name
      t.integer :tournament_id

      t.timestamps null: false
    end
    add_index :pools, :name
    add_index :pools, :tournament_id
  end
end
