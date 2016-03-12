class Match < ActiveRecord::Base
	
	belongs_to :tournament
	belongs_to :team_left, class_name: "Team", foreign_key: "team_left_id"
  	belongs_to :team_right, class_name: "Team", foreign_key: "team_right_id"

  	default_scope { where("match_date is not null") }
  	scope :date_desc, -> {order("match_date desc nulls last")}
  	scope :date_asc, -> {order("match_date asc nulls last")}
  	scope :completed, -> {where(is_completed: true)}
  	scope :not_completed, -> {where(is_completed: false)}

  	attr_accessor   :score_raw

  	translates :stage

	def score_raw
		self.score.join("\n") unless self.score.nil?
	end

	def score_raw=(values)
		self.score = []
		self.score=values.split("\n")
	end
end
