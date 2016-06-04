class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    flash[:msg] = "លោកអ្នកបានជ្រើសរើសយកក្រុមប្រកួតដូចខាងក្រោម
ប្រសិនបើក្រុមណាមួយក្លាយជាម្ចាស់ជើងឯក LEO CUP NATIONAL VOLLEYBALL 2016"
    redirect_to root_url+"#all_voting"
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url+"#all_voting"
  end
end
