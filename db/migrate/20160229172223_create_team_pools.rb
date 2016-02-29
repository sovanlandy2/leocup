class CreateTeamPools < ActiveRecord::Migration
  def change
    create_table :team_pools do |t|
      t.integer :team_id
      t.integer :pool_id

      t.timestamps null: false
    end
    add_index :team_pools, :team_id
    add_index :team_pools, :pool_id
  end
end
