class AddRegionMatch < ActiveRecord::Migration
	def self.up
	    Match.create_translation_table!({
	      :stage => :string
	    }, {
	      :migrate_data => true
	    })
	  end

	  def self.down
	    Match.drop_translation_table! :migrate_data => true
	  end
end
