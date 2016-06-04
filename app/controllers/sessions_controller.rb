class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    flash[:msg] = "ការចូលទៅកាន់ប្រព័ន្ធជោគជ័យ! លោកអ្នកអាចចុចជ្រើសរើសបានរហូតដល់ទៅ 5ក្រុម"
    redirect_to root_url+"#all_voting"
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url+"#all_voting"
  end
end
