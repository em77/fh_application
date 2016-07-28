require "rails_helper"

feature "app submit" do
  scenario "user can submit an app with valid attachments" do
    visit new_app_path
    page.attach_file(
        "_psych_eval",
        Rails.root.join("lib/sample_attachments/notes.pdf")
      )
    page.attach_file(
      "_psych_social",
      Rails.root.join("lib/sample_attachments/utopia.pdf")
    )
    fill_out_app
    click_on "Submit Application"
    expect(page).to have_content "Your application was submitted"
  end

  scenario "user cannot submit an app with spoofed attachments" do
    visit new_app_path
    page.attach_file(
        "_psych_eval",
        Rails.root.join("lib/sample_attachments/notes.pdf")
      )
    page.attach_file(
      "_psych_social",
      Rails.root.join("lib/sample_attachments/spoof.pdf")
    )
    fill_out_app
    click_on "Submit Application"
    expect(page).to have_content ("Uploaded file may only be a .pdf, .doc," +
      " or .docx file")
  end
end
