require "rails_helper"

feature "app submit" do
  scenario "user can submit an app with valid attachments" do
    visit new_app_path
    fill_out_app
    click_on "Submit Application"
    expect(page).to have_content "Your application was submitted"
  end
end
