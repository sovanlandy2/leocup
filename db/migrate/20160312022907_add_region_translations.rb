class AddRegionTranslations < ActiveRecord::Migration
  def self.up
    Region.create_translation_table!({
      :name => :string
    }, {
      :migrate_data => true
    })
  end

  def self.down
    Region.drop_translation_table! :migrate_data => true
  end
end
