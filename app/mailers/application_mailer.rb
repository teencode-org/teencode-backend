class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  TEENCODEADMINEMAIL = 'teencodeafrica@gmail.com'.freeze
  layout 'mailer'
end
