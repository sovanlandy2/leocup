class AddIsCompleteToMatches < ActiveRecord::Migration
  def change
    add_column :matches, :is_completed, :boolean, default: false
  end
end
