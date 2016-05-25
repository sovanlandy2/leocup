class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    flash[:msg] = "You have logged in successfully, please click on team name or 'Start Voting' again to vote"
    redirect_to root_url+"#all_voting"
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url+"#all_voting"
  end
end
