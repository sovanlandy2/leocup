class Tournament < ActiveRecord::Base

	has_many :pools
	has_many :matches
	has_many :team_pools , through: :pools

	accepts_nested_attributes_for :team_pools
	accepts_nested_attributes_for :pools

	scope :visible, -> {where(visible:true)}
	scope :current_tournaments, -> {where(is_current_tournament:true)}

	def generate_matches
		if self.pools.count == 2
			# first pool
			poolA = self.pools.first
			poolB = self.pools.last
			teamsA = poolA.teams.to_a 
			teamsB = poolB.teams.to_a 
			size = teamsA.size
			(0..size-1).each do |l|
				(1..size-1).each do |j|
					if (l != j)
						match = Match.where(team_left_id: teamsA[l].id, team_right_id: teamsA[j].id, tournament_id: self.id).first_or_create(score: ["0-0", "0-0", "0-0", "0-0"], stage: poolA.name)
						puts "Create a match: " 
						puts match.attributes
					end
				end
			end

			(0..size-1).each do |l|
				(1..size-1).each do |j|
					if (l != j)
						match = Match.where(team_left_id: teamsB[l].id, team_right_id: teamsB[j].id, tournament_id: self.id).first_or_create(score: ["0-0", "0-0", "0-0", "0-0"], stage: poolB.name)
						puts "Create a match: " 
						puts match.attributes
					end
				end
			end
		end
	end
end
