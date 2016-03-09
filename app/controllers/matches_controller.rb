class MatchesController < ApplicationController
	def index
		@current_tournament = Tournament.where(is_current_tournament: true).first || Tournament.first
		@matches = @current_tournament.matches.order("match_date desc nulls last")
	end

	def refresh
		@current_tournament = Tournament.find_by(id: params[:id]) || Tournament.first
		@matches = @current_tournament.matches.order("match_date desc nulls last")	
		respond_to do |format|
		  format.html { redirect_to matches_url }
		  format.js
		end
	end

	def select_matches
		@current_tournament = Tournament.find_by(id: params[:id]) || Tournament.first
		
		if !params[:is_completed].present?
			@matches = @current_tournament.matches.order("match_date desc nulls last")	
		elsif params[:is_completed].present? && params[:is_completed] == 'true'
			@matches = @current_tournament.matches.where(is_completed: true).order("match_date desc nulls last")
		else
			@matches = @current_tournament.matches.where(is_completed: false).order("match_date asc nulls last")
		end

		respond_to do |format|
		  format.html { redirect_to matches_url }
		  format.js
		end
	end

end