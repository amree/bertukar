class SearchController < ApplicationController
  skip_before_filter :require_authentication

  def index
    if params[:gred].nil? && params[:location].nil?
      @searched = false
    else
      @searched = true
      @jobs = Job.includes(next_jobs: [location: :state], location: :state).main.latest.search(params).page params[:page]
    end
  end
end
