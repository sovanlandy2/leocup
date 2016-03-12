class Pool < ActiveRecord::Base
	
	belongs_to :tournament
	has_many :team_pools
	has_many :teams, through: :team_pools
	accepts_nested_attributes_for :team_pools,
           :reject_if => :all_blank,
           :allow_destroy => true

    translates :name
end
