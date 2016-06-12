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
		@gallery_photos = GalleryPhoto.order("created_at desc").limit(16)
		@winning_teams_raw = Team.where(id: @current_tournament.team_pools.pluck(:team_id))
		@winning_teams = @winning_teams_raw.to_a.each_slice(5).to_a
		@total_votes = TeamVote.count
		if current_user.present?
			@current_voted_teams = TeamVote.where(user_id: current_user.id).pluck(:team_id)
		end
		image_url = @gallery_photos.first.photo.url rescue nil
		set_meta_tags og: { url: "http://www.leocupvolleyball.com", type: "website", title: "Leo Cup National Volleyball 2016",image: image_url, description: "See teams, matches result & schedule and gallery photos from the Leo Cup National Volleybal 2016"}
	end
end
