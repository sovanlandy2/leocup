class AddTournamentIdToTeamVotes < ActiveRecord::Migration
  def change
    add_column :team_votes, :tournament_id, :integer
    add_index :team_votes, :tournament_id
  end
end
