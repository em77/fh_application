class AppMailer < ApplicationMailer
  def new_app_email(app_name, file_urls, house)
    @app_name = app_name
    @file_urls = file_urls

    mail to: ENV["#{house.upcase}_EMAIL"],
         subject: "New member application from #{app_name}"
  end
end
