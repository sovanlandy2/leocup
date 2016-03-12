class TranslatePool < ActiveRecord::Migration
  def self.up
    Pool.create_translation_table!({
      :name => :string
    }, {
      :migrate_data => true
    })
  end

  def self.down
    Pool.drop_translation_table! :migrate_data => true
  end
end
