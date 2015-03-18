class SearchesController < ApplicationController

  def search
    @user = User.find_by_name(params[:username])
    if @user
      redirect_to user_path(@user)
    else
      redirect_to users_path
    end
  end
end
