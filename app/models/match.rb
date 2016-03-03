class Match < ActiveRecord::Base
	
	belongs_to :tournament
	belongs_to :team_left, class_name: "Team", foreign_key: "team_left_id"
  	belongs_to :team_right, class_name: "Team", foreign_key: "team_right_id"

  	attr_accessor   :score_raw

	def score_raw
		self.score.join("\n") unless self.score.nil?
	end

	def score_raw=(values)
		self.score = []
		self.score=values.split("\n")
	end
end
