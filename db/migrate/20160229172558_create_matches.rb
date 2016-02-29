class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.integer :tournament_id
      t.integer_id :team_left
      t.integer_id :team_right
      t.datetime :match_date
      t.string :score
      t.string :stage
      t.string :location
      t.boolean :visible

      t.timestamps null: false
    end
    add_index :matches, :tournament_id
    add_index :matches, :team_left
    add_index :matches, :team_right
  end
end
