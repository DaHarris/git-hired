class GitFetchersController < ApplicationController
  def index
    @gitfetcher = Gitfetcher.new
    @repos = @gitfetcher.get_repos

    if params[:username].present?
      @profile = @gitfetcher.get_profile(params[:username])
    end
  end

end
