class TranslateTeam < ActiveRecord::Migration
  def self.up
    Team.create_translation_table!({
      :name => :string,
      :description => :text
    }, {
      :migrate_data => true
    })
  end

  def self.down
    Team.drop_translation_table! :migrate_data => true
  end
end
