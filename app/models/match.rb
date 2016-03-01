class Match < ActiveRecord::Base
	belongs_to :tournament
	belongs_to :team_left, class_name: "Team", foreign_key: "team_left"
  belongs_to :team_right, class_name: "Team", foreign_key: "team_right"
end
