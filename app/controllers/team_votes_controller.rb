class TeamVotesController < ApplicationController

	def create
		user = current_user
		return 		redirect_to root_url+"#all_voting" if !user.present? || !params[:team_ids].present?
		requests_team_ids = params[:team_ids].split(",").map{|r| r.to_i}.sort
		existing_team_ids = TeamVote.where(user: user).pluck(:team_id).sort
		to_delete_ids = existing_team_ids - requests_team_ids
		to_create_ids = requests_team_ids - existing_team_ids

		TeamVote.where(user:user, team_id: to_delete_ids).destroy_all
		
		to_create_ids.each do |id|
			TeamVote.where(user:user, team_id: id).first_or_create
		end
		redirect_to root_url+"#all_voting"
	end	

	def winner
		@users = User.all 
	end
end