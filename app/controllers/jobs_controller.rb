class JobsController < ApplicationController

  def index
    search_type = params[:search_params]
    search_text = params[:search_text]
    if search_text == nil || search_text ==""
      @jobs = Job.all
    elsif search_type == "Jobs"
      @jobs = Job.where("description ilike '%#{search_text}'")
      @jobs_where = Job.where("location ilike '%#{search_text}'")
      if @jobs_where != []
        @jobs << @jobs_where
      end
      @jobs = @jobs.flatten
      @jobs = @jobs.uniq
    end
  end

  def show
    @job = Job.find_by_id(params[:id])
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(jobs_params)
    @job.update(user_id: current_user.id)
    if @job.save
      redirect_to jobs_path
    else
      render :new
    end
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    @job.update(jobs_params)
    redirect_to jobs_path
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    redirect_to jobs_path
  end

  private

  def jobs_params
    params.require(:job).permit(:description, :location, :link)
  end
end
