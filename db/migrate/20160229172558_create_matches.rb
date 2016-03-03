class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.integer :tournament_id
      t.integer :team_left_id
      t.integer :team_right_id
      t.datetime :match_date
      t.text :score, array: true
      t.string :stage
      t.string :location
      t.boolean :visible, default: true

      t.timestamps null: false
    end
    add_index :matches, :tournament_id
    add_index :matches, :team_left_id
    add_index :matches, :team_right_id
  end
end
  