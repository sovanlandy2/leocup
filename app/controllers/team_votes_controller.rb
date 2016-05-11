class TeamVotesController < ApplicationController

	def create
		user = current_user
		redirect_to root_url+"#all_voting" if !user.present? || !params[:team_id].present?
		team_id = params[:team_id].to_i
		t = TeamVote.where(user: user).first
		t = TeamVote.new if !t.present? 
		t.user_id = user.id
		t.team_id = team_id 
		t.save
		redirect_to root_url+"#all_voting"
	end	
end