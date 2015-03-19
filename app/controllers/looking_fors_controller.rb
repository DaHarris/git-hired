class LookingForsController < ApplicationController

  def show
    @lf = LookingFor.all
  end

  def new
    @lf = LookingFor.new
  end

  def create
    @user = User.find(params[:id])
    @lf = LookingFor.new()
    if params[:location]
      @lf.location = params[:location]
    end
    if params[:language]
      @lf.language = params[:language]
    end
    if params[:quality]
      @lf.quality = params[:quality]
    end
    @lf.user_id = @user.id
    if @lf.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def edit
    @lf = LookingFor.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @lf = LookingFor.find(params[:lf_id])
    if params[:location] != ""
      @lf.update(location: params[:location])
    end
    if params[:language] != ""
      @lf.update(language: params[:language])
    end
    if params[:quality] != ""
      @lf.update(quality: params[:quality])
    end
    redirect_to user_path(@user)
  end

end
