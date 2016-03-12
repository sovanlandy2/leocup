class AddTranslatePlayer < ActiveRecord::Migration
  def self.up
    Player.create_translation_table!({
      :name => :string,
    }, {
      :migrate_data => true
    })
  end

  def self.down
    Player.drop_translation_table! :migrate_data => true
  end
end
