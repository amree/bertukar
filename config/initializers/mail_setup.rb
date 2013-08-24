# Workaround for mailcatcher
if Rails.env == 'development'
  Mail.defaults do
    delivery_method :smtp,
      :address => '127.0.0.1',
      :port => 1025,
      :host => '127.0.0.1'
  end
end
