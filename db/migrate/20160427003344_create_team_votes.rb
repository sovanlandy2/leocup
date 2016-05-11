class CreateTeamVotes < ActiveRecord::Migration
  def change
    create_table :team_votes do |t|

      t.timestamps null: false
      t.integer :team_id
      t.integer :facebook_id
    end
    add_index :team_votes, :team_id
    add_index :team_votes, :facebook_id
    add_index :team_votes, [:team_id, :facebook_id], unique: true
  end
end
