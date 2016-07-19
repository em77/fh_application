class AppsController < ApplicationController
  before_action :set_referer, only: [:new]

  attr_accessor :app
  helper_method :app

  def new
  end

  def create
    @app = TestPdfForm.new(app_params)
    app.fill_out
    if content_type_valid?(
         app.psych_eval.path,
         app.attachment_content_whitelist
         )
      send_file(app_file_path = app.export("application-#{app.unique_hex}.pdf"),
        type: "application/pdf")
      app.save
      AppMailer.new_app_email(
        "#{app.first_name} #{app.last_name}",
        app_file_path,
        app.psych_eval.file.filename
        ).deliver
      redirect_to new_app_path
    else
      flash[:error] = "Uploaded file may only be a .pdf, .doc, or .docx file"
      render :new
    end
  end

  def content_type_valid?(file_path, whitelist)
    line = Cocaine::CommandLine.new("file", "-b --mime-type #{file_path}")
    return true if whitelist.include?(line.run.chomp)
    false
  end

  private

    def app_params
      params.permit(:first_name, :last_name, :address, :address_2, :city,
        :state, :zip_code, :age, :comments, :date, :psych_eval,
        :psych_eval_file_size, :psych_eval_content_type, :psych_eval_file_name,
        :psych_eval_updated_at, :test_checkbox, :id)
    end
end
