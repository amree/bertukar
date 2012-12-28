class SitemapController < ApplicationController
  skip_before_filter :require_authentication

  def index
    static_urls = [ {:url => '/about',      :updated_at => ""} ]
    @pages_to_visit  = static_urls
    @pages_to_visit += Location.states.all.collect { |l| { url: listings_states_path(id: l.to_param), updated_at: l.updated_at.xmlschema } }
    @pages_to_visit += Job.main.all.collect { |a| { url: job_path(a), updated_at: a.updated_at.xmlschema } }
    respond_to do |format|
      format.xml
    end
  end
end