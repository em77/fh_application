# Preview all emails at http://localhost:3000/rails/mailers/app_mailer
class AppMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/app_mailer/new_app_email
  def new_app_email
    AppMailer.new_app_email("FirstName LastName")
  end

end
