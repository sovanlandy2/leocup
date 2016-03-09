class CreateAddIsCurrentTournamentToToursnaments < ActiveRecord::Migration
  def change
    create_table :add_is_current_tournament_to_toursnaments do |t|
      t.boolean :is_current_tournament, default: false

      t.timestamps null: false
    end
  end
end
