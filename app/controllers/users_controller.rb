class UsersController < ApplicationController
  respond_to :html, :json
  

  def welcome
    render :layout => false
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find_by_id(params[:id])
    @looking_for = LookingFor.new

    if @user.role == "employer" && @user.id = params[:id]
      redirect_to users_path
    end

    @employment = Employment.where(user_id: @user.id)
    @education = Education.where(user_id: @user.id)
    @skills = Skill.where(user_id: @user.id)
  end

  def destroy_repo
    @user = User.find(params[:id])
    @repo = Repo.find_by_id(params[:repo_id])
    @repo.update(show: false)
    redirect_to git_path(@user)
  end

  def git
    @user = User.find_by_id(params[:id])

    @get_repos = Repo.where(user_id: @user.id)

    @projects = Project.where(user_id: @user.id)
  end

  def new
    @user = User.find(params[:id])
    @looking_for = LookingFor.new
  end

  def create
    @user = User.find(params[:id])
    @looking_for = LookingFor.new(looking_for_params)
    @looking_for.user_id = @user_id

    if @looking_for.save
      redirect_to user_path(@looking_for.user_id), notice: "Preferences noted"
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if params[:emp_id].present?
      @employment = Employment.find(params[:emp_id])
      respond_to do |format|
        if @employment.update_attributes(employment_params)
          format.html { redirect_to(@user, :notice => 'Work history was successfully updated') }
          format.json { respond_with @user }
        else
          format.html { render :action => 'edit' }
          format.json { respond_with_bip(@user)}
        end
      end

    elsif
      if params[:edu_id].present?
        @education = Education.find(params[:edu_id])
        respond_to do |format|
          if @education.update_attributes(education_params)
            format.html { redirect_to(@user, :notice => 'Education was successfully updated') }
            format.json { respond_with @user }
          else
            format.html { render :action => 'edit' }
            format.json { respond_with_bip(@user)}
          end
        end
      end
      elsif
        if params[:ski_id].present?
          @skill = Skill.find(params[:ski_id])
          respond_to do |format|
            if @skill.update_attributes(skill_params)
              format.html { redirect_to(@user, :notice => 'Skills changed!') }
              format.json { respond_with @user }
            else
              format.html { render :action => 'edit' }
              format.json { respond_with_bip(@user)}
            end
          end
        end

        else
          if params[:lf_id].present?
            @looking_for = LookingFor.find(params[:lf_id])
            respond_to do |format|
              if @looking_for.update_attributes(looking_for_params)
                format.html { redirect_to(@user, :notice => 'Dreams, wishes and ') }
                format.json { respond_with @user }
              else
                format.html { render :action => 'edit' }
                format.json { respond_with_bip(@user)}
              end
            end
          end
        end
      end




    def first_splash
      @user = User.find_by_id(params[:id])
    end

    def role_set
      @user = User.find_by_id(params[:id])
      @user.update(role: params[:user][:role])
      redirect_to second_splash_path
    end

    def second_splash
      @user = User.find_by_id(params[:id])
      if @user.role == "employer"
        redirect_to users_path
      end
    end

    def git_set
      @user = User.find_by_id(params[:id])
      @user.update(github_id: params[:user][:github_id])

      @gitfetcher = GitFetcher.new
      @name = @gitfetcher.name(@user.github_id)
      @email = @gitfetcher.email(@user.github_id)
      @get_repos = @gitfetcher.repositories(@user.github_id)
      @avatar = @gitfetcher.avatar(@user.github_id)

      @get_repos.each do |repo|
        Repo.create(user_id: @user.id, name: repo.name,
        url: "https://github.com/#{repo.full_name}")
      end
      @user.update(avatar: @avatar)

      if params[:user][:twitter_username]
        @user.update(twitter_username: params[:user][:twitter_username])
      end

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


    private

    def employment_params
      params.require(:employment).permit(:company, :title)
    end
    def education_params
      params.require(:education).permit(:school, :field_of_study)
    end
    def skill_params
      params.require(:skill).permit(:name)
    end
    def looking_for_params
      params.require(:looking_for).permit(:quality, :language, :location)
    end
  end
