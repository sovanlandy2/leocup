class AddLocationToUser < ActiveRecord::Migration
  def change
  	add_column :users, :location, :string
  	add_column :users, :age_range, :string
  	add_column :users, :hometown, :string
  	add_column :users, :gender, :string
  end
end
