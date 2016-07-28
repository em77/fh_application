class AppMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.app_mailer.new_app_email.subject
  #

  def new_app_email(app_name, app_file_path, attachment_save_names_array)
    @app_name = app_name

    attachments[File.basename(app_file_path)] = File.read(app_file_path)
    
    attachment_save_names_array.each do |a|
      attachments[a] = File.read(
        Rails.root.join("tmp/uploads/#{a}")
      )
    end

    mail to: ENV["NEW_APP_EMAIL_TO"],
         subject: "New member application from #{app_name}"
  end
end
