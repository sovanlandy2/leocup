class TeamVotesController < ApplicationController

	def create
		user = current_user
		return 		redirect_to root_url+"#all_voting" if !user.present? || !params[:team_ids].present?
		current_tournament = Tournament.visible
									   .current_tournaments.first || Tournament.first
		requests_team_ids = params[:team_ids].split(",").map{|r| r.to_i}.sort
		existing_team_ids = TeamVote.where(user: user, tournament_id: current_tournament.id)
									.pluck(:team_id)
									.sort
		to_delete_ids = existing_team_ids - requests_team_ids
		to_create_ids = requests_team_ids - existing_team_ids

		TeamVote.where(user:user, team_id: to_delete_ids).destroy_all
		
		to_create_ids.each do |id|
			TeamVote.where(user:user, team_id: id, tournament_id: current_tournament.id).first_or_create
		end
		redirect_to root_url+"#all_voting"
	end	

	def winner
		gon.users = User.order('id desc').pluck(:name) 
		gon.images = User.order('id desc').pluck(:uid)
	end
end