class TeamVote < ActiveRecord::Base
	belongs_to :user
	belongs_to :team
	belongs_to :tournament
end