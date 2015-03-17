class SessionsController < ApplicationController

  def create
    auth = request.env["omniauth.auth"]
    if User.find_by_uid(auth["uid"])
      user = User.find_by_provider_and_uid(auth["provider"], auth["uid"])
      session[:user_id] = user.id
      user.update(token: env["omniauth.auth"]["credentials"]["token"])
      redirect_to user_path(user), :notice => "Signed in!"
    else
      user = User.create_with_omniauth(auth, params)
      session[:user_id] = user.id
      user.update(token: env["omniauth.auth"]["credentials"]["token"])
      redirect_to first_splash_path(user), :notice => "Signed in!"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Signed out!"
  end
end
