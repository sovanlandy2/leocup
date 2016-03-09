class AddIsCurrentTournamentToToursnament < ActiveRecord::Migration
  def change
    add_column :tournaments, :is_current_tournament, :boolean, default: false
  end
end
