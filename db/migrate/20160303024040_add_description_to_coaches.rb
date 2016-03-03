class AddDescriptionToCoaches < ActiveRecord::Migration
  def change
    add_column :coaches, :description, :text
  end
end
