class SearchesController < ApplicationController

  def search
    @user = User.where("name ilike '%#{params[:username]}%'")
    if @user[0]
      redirect_to user_path(@user[0])
    else
      redirect_to users_path
    end
  end
end
