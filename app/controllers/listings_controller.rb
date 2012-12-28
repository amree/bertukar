class ListingsController < ApplicationController
  skip_before_filter :require_authentication

  def states
    @jobs = Job.includes(next_jobs: [location: :state], location: :state)
               .main
               .latest
               .search({location: params[:id]})
               .page params[:page]

    @state = Location.find(params[:id])
  end
end
