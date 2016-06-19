class AddHasDropoutToTeam < ActiveRecord::Migration
  def change
    add_column :teams, :has_droppedout, :boolean, default: false
  end
end
