class TeamsController < ApplicationController
	def index
		@current_region = Region.first
		@current_team = @current_region.teams.first
		@current_coach = @current_team.coach
		@teams = @current_region.teams
	end

	def show
		@current_team = Team.find_by(id: params[:id])
		@current_region = @current_team.region
		@teams = @current_region.teams
		@current_coach = @current_team.coach
		render :index
	end

	def select_region
		@current_region = Region.find_by(id: params[:region_id])
		@teams = @current_region.teams
		@current_team = @teams.first
		respond_to do |format|
		  format.html { redirect_to matches_url }
		  format.js
		end
	end

	def select_team
		@current_team = Team.find_by(id: params[:id])
		@current_region = @current_team.region
		@teams = @current_region.teams
		@current_coach = @current_team.coach
		respond_to do |format|
		  format.html { redirect_to matches_url }
		  format.js
		end
	end
end