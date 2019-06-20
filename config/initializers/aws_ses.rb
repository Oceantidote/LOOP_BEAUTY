ActionMailer::Base.add_delivery_method :ses, AWS::SES::Base,
  access_key_id: ENV['AWS_SMTP_KEY_ID'],
  secret_access_key: ENV['AWS_SMTP_SECRET_ACCESS_KEY']
