class AppsController < ApplicationController
  attr_accessor :app
  helper_method :app

  def new
  end

  def create
    @app = TestPdfForm.new(app_params)
    app.fill_out
    # if app.valid?
      send_file(file_name = app.export("application-#{app.unique_hex}.pdf"),
        type: "application/pdf")
      app.save
    # end
    redirect_to new_app_path
  end

  private

    def app_params
      params.permit(:first_name, :last_name, :address, :address_2, :city,
        :state, :zip_code, :age, :comments, :date, :psych_eval,
        :psych_eval_file_size, :psych_eval_content_type, :psych_eval_file_name,
        :psych_eval_updated_at, :id)
    end
end
