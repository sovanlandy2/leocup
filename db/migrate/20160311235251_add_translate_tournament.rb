class AddTranslateTournament < ActiveRecord::Migration
  def self.up
    Tournament.create_translation_table!({
      :name => :string,
      :location => :string
    }, {
      :migrate_data => true
    })
  end

  def self.down
    Tournament.drop_translation_table! :migrate_data => true
  end
end
