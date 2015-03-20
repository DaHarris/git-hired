class SearchesController < ApplicationController

  def search
    if params[:Search_Parameters] == "Users"
      @user = User.where("name ilike '%#{params[:search_text]}%'")
      if @user[0]
        redirect_to user_path(@user[0])
      else
        redirect_to users_path
      end
    elsif params[:Search_Parameters] == "Jobs"
      redirect_to :controller => 'jobs', :action => 'index', :search_params => params[:Search_Parameters], :search_text => params[:search_text]
    elsif params[:Search_Parameters] == "Skills"
      redirect_to :controller => 'users', :action => 'index', :search_params => params[:Search_Parameters], :search_text => params[:search_text]
    else
      redirect_to users_path
    end
  end
end
