class VisitorsController < ApplicationController
	def index
		@matches = Match.completed
		                .includes([{team_left: :region}, {team_right: :region}])
		                .date_desc
		                .limit(5)
		#@voted_teams = Team.all.last(10)
		@current_tournament = Tournament.visible
										.includes(:pools, :matches , :team_pools)
										.current_tournaments.first || Tournament.first
		@gallery_photos = GalleryPhoto.order("created_at desc").limit(30)

		image_url = @gallery_photos.first.photo.url rescue nil
		set_meta_tags og: { image: image_url}
	end
end
