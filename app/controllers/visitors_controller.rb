class VisitorsController < ApplicationController
	def index
		@matches = Match.order("match_date desc nulls last").limit(5)
		@voted_teams = Team.all.last(10)
		@current_tournament = Tournament.first
		@gallery_photos = GalleryPhoto.order("created_at desc").limit(30)
	end
end
