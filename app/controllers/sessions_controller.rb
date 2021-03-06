class SessionsController < ApplicationController
  def create     
    auth = request.env["omniauth.auth"]     
    user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)     
    session[:user_id] = user.id     
    session[:token] = auth["credentials"]["token"]
    session[:tokensecret] = auth["credentials"]["secret"]
    session[:user_name] = auth["extra"]["raw_info"]["username"]
    redirect_to '/'+ session[:user_name], :notice => "Signed in!"
  end
  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Signed out!"
  end
end
