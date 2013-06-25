Airbrake.configure do |config|
  config.api_key = ''
  config.host    = ''
  config.port    = 80
  config.secure  = config.port == 443
end
