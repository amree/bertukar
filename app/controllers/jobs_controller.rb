class JobsController < ApplicationController
  # GET /jobs
  def index
    @jobs = current_user.jobs.all
  end

  # GET /jobs/1
  def show
    @job = current_user.jobs.find(params[:id])
  end

  # GET /jobs/new
  def new
    @job = Job.new(expired_at: Time.now + 6.months)
    @job.next_jobs.build
  end

  # GET /jobs/1/edit
  def edit
    @job = current_user.jobs.find(params[:id])
    @job.next_jobs.build
  end

  # POST /jobs
  def create
    @job = current_user.jobs.new(params[:job])

    if @job.save
      redirect_to @job, notice: 'Job was successfully created.'
    else
      render action: "new"
    end
  end

  # PUT /jobs/1
  def update
    @job = current_user.jobs.find(params[:id])

    if @job.update_attributes(params[:job])
      redirect_to @job, notice: 'Job was successfully updated.'
    else
      render action: "edit"
    end
  end

  # DELETE /jobs/1
  def destroy
    @job = current_user.jobs.find(params[:id])
    @job.destroy

    redirect_to jobs_url
  end
end
