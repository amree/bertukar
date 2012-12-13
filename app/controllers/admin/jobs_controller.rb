class Admin::JobsController < ApplicationController
  before_filter :require_admin

  # GET /admin/jobs
  def index
    @jobs = Job.main.page params[:page]
  end

  # GET /admin/jobs/1
  def show
    @job = Job.find(params[:id])

    render 'jobs/job'
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
