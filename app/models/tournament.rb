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
			
			poolA.teams.each do |team1|
				poolA.teams.each do |team2|
					if (team1.id != team2.id)
						match = Match.where(team_left_id: team1, team_right_id: team2, tournament_id: self.id).first_or_create(score: ["0-0", "0-0", "0-0", "0-0"], stage: poolA.name)
						puts "Create a match: " 
						puts match.attributes
					end
				end
			end

			poolB.teams.each do |team1|
				poolB.teams.each do |team2|
					if (team1.id != team2.id)
						match = Match.where(team_left_id: team1, team_right_id: team2, tournament_id: self.id).first_or_create(score: ["0-0", "0-0", "0-0", "0-0"], stage: poolB.name)
						puts "Create a match: " 
						puts match.attributes
					end
				end
			end
		end
	end
end
