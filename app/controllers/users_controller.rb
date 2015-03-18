class UsersController < ApplicationController

  def welcome
    render :layout => false
  end

  def index
    @users = Users.all
  end

  def show

    @user = User.find_by_id(params[:id])

    @gitfetcher = GitFetcher.new
    @name = @gitfetcher.name(params[:uid])
    @email = @gitfetcher.email(params[:uid])
    @get_repos = @gitfetcher.repositories(params[:uid])

    @employment = Employment.where(user_id: @user.id)
    @education = Education.where(user_id: @user.id)
    @skills = Skill.where(user_id: @user.id)
  end

  def git

    @user = User.find_by_id(params[:id])

    @gitfetcher = GitFetcher.new
    @name = @gitfetcher.name(@user.github_id)
    @email = @gitfetcher.email(@user.github_id)
    @get_repos = @gitfetcher.repositories(@user.github_id)

    @projects = Project.where(user_id: @user.id)
  end

  def create
  end

  def first_splash
    @user = User.find_by_id(params[:id])
  end

  def role_set
    @user = User.find_by_id(params[:id])
    @user.update(role: params[:role])
    redirect_to second_splash_path
  end

  def second_splash
    @user = User.find_by_id(params[:id])
  end

  def git_set
    @user = User.find_by_id(params[:id])
    @user.update(github_id: params[:user][:github_id])
    redirect_to third_splash_path(@user)
  end

  def third_splash
    @user = User.find_by_id(params[:id])
  end

  def project_set
    @user = User.find_by_id(params[:id])
    if params[:url] != ""
      @project = Project.create(url: params[:url],
                                description: params[:description],
                                user_id: @user.id)
    end
    if params[:url2] != ""
      @project = Project.create(url: params[:url2],
                                description: params[:description2],
                                user_id: @user.id)
    end
    if params[:url3] != ""
      @project = Project.create(url: params[:url3],
                                description: params[:description3],
                                user_id: @user.id)
    end
    redirect_to user_path(@user)
  end
end
