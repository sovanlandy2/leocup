class CreateCoaches < ActiveRecord::Migration
  def change
    create_table :coaches do |t|
      t.string :name
      t.integer :team_id
      t.integer :age

      t.timestamps null: false
    end
    add_index :coaches, :name
    add_index :coaches, :team_id
  end
end
