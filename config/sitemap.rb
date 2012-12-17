# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://bertukar.com/"

SitemapGenerator::Sitemap.create do
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  add '/about'
  Job.main.find_each do |job|
    add job.to_param, lastmod: job.updated_at
  end
end
