class AppsController < ApplicationController
  attr_accessor :app
  helper_method :app

  def new
    @app = TestPdfForm.new
  end

  def create
    @app = TestPdfForm.new(app_params)
    app.fill_out
    if app.valid?
      send_file app.export, type: "application/pdf"
    end
    redirect_to new_app_path
  end

  private

    def app_params
      params.permit(:first_name, :last_name, :address,
        :address_2, :city, :state, :zip_code, :age, :comments, :date)
    end
end
