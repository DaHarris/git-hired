class UsersController < ApplicationController

  def index
  end

  def show
    @gitfetcher = GitFetcher.new
    @name = @gitfetcher.name(params[:username])
    @email = @gitfetcher.email(params[:username])
    @repos = @gitfetcher.get_repos(params[:username])
  end

  def create
  end

end
