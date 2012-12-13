class SearchController < ApplicationController
  skip_before_filter :require_authentication

  def index
    if params[:q].nil?
      @searched = false
      @q = Job.main.search(params[:q])
    else
      @searched = true
      @q = Job.main.search(params[:q])
      @jobs = @q.result.page params[:page]
    end
  end

  def show
    @job = Job.find(params[:id])

    render 'jobs/job'
  end
end
