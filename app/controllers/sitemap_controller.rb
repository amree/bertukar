class SitemapController < ApplicationController
  skip_before_filter :require_authentication

  def index
    static_urls = [ {:url => '/about',      :updated_at => ""} ]
    @pages_to_visit  = static_urls
    @pages_to_visit += Job.main.all.collect { |a| { url: job_path(a), updated_at: a.updated_at.xmlschema } }
    respond_to do |format|
      format.xml
    end
  end
end