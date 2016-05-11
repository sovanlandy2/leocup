class AddUserIdToTeamVotes < ActiveRecord::Migration
  def change
    add_column :team_votes, :user_id, :integer
    add_index :team_votes, :user_id
  end
end
