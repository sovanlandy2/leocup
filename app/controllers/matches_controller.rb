class MatchesController < ApplicationController
	def index
		@current_tournament = Tournament.visible
										.current_tournaments
		                                .includes(:pools, :matches , :team_pools)
		                                .first
		@matches =   @current_tournament.matches
		                                .includes([{team_left: :region}, {team_right: :region}])
		                                .completed
									    .date_desc
	end

	def refresh
		@current_tournament = Tournament.visible
										.includes(:pools, :matches , :team_pools)
										.find_by(id: params[:id]) || Tournament.first
		@matches = @current_tournament.matches
									  .includes([{team_left: :region}, {team_right: :region}])
									  .date_desc
		respond_to do |format|
		  format.html { redirect_to matches_url }
		  format.js
		end
	end

	def select_matches
		@current_tournament = Tournament.visible
										.includes(:pools, :matches , :team_pools)
		                                .find_by(id: params[:id]) || Tournament.first
		
		if !params[:is_completed].present?
			@matches = @current_tournament.matches
										  .includes([{team_left: :region}, {team_right: :region}])
									      .date_desc
		elsif params[:is_completed].present? && params[:is_completed] == 'true'
			@matches = @current_tournament.matches
										  .includes([{team_left: :region}, {team_right: :region}])
			                              .completed
			                              .date_desc
		else
			@matches = @current_tournament.matches
			                              .includes([{team_left: :region}, {team_right: :region}])
										  .not_completed
			                              .date_asc
		end

		respond_to do |format|
		  format.html { redirect_to matches_url }
		  format.js
		end
	end

end