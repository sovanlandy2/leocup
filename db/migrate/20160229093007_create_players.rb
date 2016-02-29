class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.integer :number
      t.integer :team_id
      t.float :height
      t.string :role

      t.timestamps null: false
    end
    add_index :players, :name
    add_index :players, :team_id
  end
end
