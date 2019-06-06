class ApplicationMailer < ActionMailer::Base
  default from: 'noreply@example.com' # Depends on the type of email.
  layout 'mailer'
end
