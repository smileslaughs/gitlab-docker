ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :address => 'MAIL_ADDRESS',
  :port => MAIL_PORT,
  :domain => 'MAIL_DOMAIN',
  :authentication => :plain,
  :user_name => 'MAIL_USERNAME',
  :password => 'MAIL_PASSWORD',
  :enable_starttls_auto => true
}