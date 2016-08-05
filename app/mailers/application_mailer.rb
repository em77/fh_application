class ApplicationMailer < ActionMailer::Base
  default from: "apply@#{ENV["DOMAIN"]}.org"
  layout "mailer"
end
