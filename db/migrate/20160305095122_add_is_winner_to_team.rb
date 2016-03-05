class AddIsWinnerToTeam < ActiveRecord::Migration
  def change
    add_column :teams, :is_winner, :boolean, default: false
  end
end
