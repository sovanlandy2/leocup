class Tournament < ActiveRecord::Base

	has_many :pools
	has_many :matches
	has_many :team_pools , through: :pools

	accepts_nested_attributes_for :team_pools
	accepts_nested_attributes_for :pools
end
