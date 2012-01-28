class JobsController < ApplicationController
  # GET /jobs
  def index
    @jobs = Job.all
  end

  # GET /jobs/1
  def show
    @job = Job.find(params[:id])
  end

  # GET /jobs/new
  def new
    @job = Job.new
  end

  # GET /jobs/1/edit
  def edit
    @job = Job.find(params[:id])
  end

  # POST /jobs
  def create
    @job = Job.new(params[:job])

    if @job.save
      redirect_to @job, notice: 'Job was successfully created.'
    else
      render action: "new"
    end
  end

  # PUT /jobs/1
  def update
    @job = Job.find(params[:id])

    if @job.update_attributes(params[:job])
      redirect_to @job, notice: 'Job was successfully updated.'
    else
      render action: "edit"
    end
  end

  # DELETE /jobs/1
  def destroy
    @job = Job.find(params[:id])
    @job.destroy

    redirect_to jobs_url
  end
end
