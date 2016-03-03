class VisitorsController < ApplicationController
	def index
		@matches = Match.order("updated_at desc").limit(5)
		@voted_teams = Team.all.last(10)
		@current_tournament = Tournament.first
	end
end
