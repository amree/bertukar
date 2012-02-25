class SearchController < ApplicationController
  def index
    if params[:q].nil?
      @noresult = true
    else
      @noresult = false
    end

    @q = Job.main.search(params[:q])
    @jobs = @q.result
  end

  def show
    @job = Job.find(params[:id])
  end
end
