class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :team_id
      t.integer :user_id

      t.timestamps null: false
    end
    add_index :votes, :user_id
    add_index :votes, :team_id
    add_index :votes, [:user_id, :team_id], unique: true
  end
end
