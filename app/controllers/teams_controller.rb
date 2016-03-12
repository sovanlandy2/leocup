class TeamsController < ApplicationController
	def index
		@current_region = Region.first
		@teams = @current_region.teams.includes(:coach, :players, [:region])
		                              .where(is_winner: true)
		@current_team = @teams.first
		@current_coach = @current_team.coach
		@gallery_photos = @current_team.team_gallery_photos
	end

	def show
		binding.pry
		@current_team = Team.includes([:region]).find_by(id: params[:id])
		@current_region = @current_team.region
		@teams = @current_region.teams.includes(:coach, :players, [:region])
		                              .where(is_winner: true)
		@current_coach = @current_team.coach
		@gallery_photos = @current_team.team_gallery_photos
		render :index
	end

	def select_region
		@current_region = Region.find_by(id: params[:region_id]) || Region.first
		@teams = @current_region.teams.includes(:coach, :players, [:region])
		                              .where(is_winner: true)
		@current_team = @teams.first
		@gallery_photos = @current_team.team_gallery_photos
		respond_to do |format|
		  format.html { redirect_to matches_url }
		  format.js
		end
	end

	def select_team
		@current_team = Team.includes([:region]).find_by(id: params[:id])
		@current_region = @current_team.region
		@teams = @current_region.teams.includes(:coach, :players, [:region])
									  .where(is_winner: true)
		@current_coach = @current_team.coach
		@gallery_photos = @current_team.team_gallery_photos
		respond_to do |format|
		  format.html { redirect_to matches_url }
		  format.js
		end
	end
end