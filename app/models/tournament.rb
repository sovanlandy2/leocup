class Tournament < ActiveRecord::Base

	has_many :pools
	has_many :matches
	has_many :team_pools , through: :pools

	accepts_nested_attributes_for :team_pools
	accepts_nested_attributes_for :pools

	def generate_matches
		if pools.size == 2
			# first pool
			poolA = pools.first
			poolB = pools.last
			size = poolA.size
			(0..size-1).each do |l|
				(1..size-1).each do |j|
					if (l != j)
						match = Match.where(team_left_id: poolA[l].id, team_right_id: poolA[j].id, tournament_id: self.id).first_or_create(score: ["0-0", "0-0", "0-0", "0-0"], stage: poolA.name)
						puts "Create a match: " 
						puts match.attributes
					end
				end
			end

			(0..size-1).each do |l|
				(1..size-1).each do |j|
					if (l != j)
						match = Match.where(team_left_id: poolB[l].id, team_right_id: poolB[j].id, tournament_id: self.id).first_or_create(score: ["0-0", "0-0", "0-0", "0-0"], stage: poolA.name)
						puts "Create a match: " 
						puts match.attributes
					end
				end
			end
		end
	end
end
