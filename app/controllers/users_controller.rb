class UsersController < ApplicationController

  def index
  end

  def show
    @gitfetcher = GitFetcher.new
    @name = @gitfetcher.name(params[:uid])
    @email = @gitfetcher.email(params[:uid])
    @get_repos = @gitfetcher.repositories(params[:uid])

  end

  def create
  end

end
