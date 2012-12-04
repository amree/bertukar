class Admin::JobsController < ApplicationController
  # GET /admin/jobs
  def index
    @jobs = Job.all
  end

  # GET /admin/jobs/1
  def show
    @job = Job.find(params[:id])
  end

  # DELETE /admin/jobs/1
  def destroy
    @job = Job.find(params[:id])

    if @job.destroy
      redirect_to admin_locations_url
    else
      redirect_to [:admin, @job], alert: @job.errors.full_messages.first
    end
  end
end
