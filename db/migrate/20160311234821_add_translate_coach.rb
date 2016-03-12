class AddTranslateCoach < ActiveRecord::Migration
  def self.up
    Coach.create_translation_table!({
      :name => :string,
      :description => :text
    }, {
      :migrate_data => true
    })
  end

  def self.down
    Coach.drop_translation_table! :migrate_data => true
  end
end
