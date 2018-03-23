require "rails_helper"

feature "app submit" do
  scenario "user can submit an app with valid attachments" do
    visit new_app_path
    page.attach_file(
        "psych_eval",
        Rails.root.join("lib/sample_attachments/notes.pdf")
      )
    page.attach_file(
      "psych_social",
      Rails.root.join("lib/sample_attachments/utopia.pdf")
    )
    page.attach_file(
        "insurance_card",
        Rails.root.join("lib/sample_attachments/sun.jpg")
      )
    fill_out_app
    click_on "Submit Application"
    expect(page).to have_content "Your application was submitted"
  end

  scenario "user cannot submit an app with spoofed attachments" do
    visit new_app_path
    page.attach_file(
        "psych_eval",
        Rails.root.join("lib/sample_attachments/notes.pdf")
      )
    page.attach_file(
      "psych_social",
      Rails.root.join("lib/sample_attachments/spoof.pdf")
    )
    page.attach_file(
        "insurance_card",
        Rails.root.join("lib/sample_attachments/sun.jpg")
      )
    fill_out_app
    click_on "Submit Application"
    expect(page).to have_content ("Uploaded file may only be a .pdf, .doc," +
      " or .docx file")
  end

  scenario "user cannot submit an app with an attachment over 7 MB" do
    visit new_app_path
    page.attach_file(
        "psych_eval",
        Rails.root.join("lib/sample_attachments/notes.pdf")
      )
    page.attach_file(
      "psych_social",
      Rails.root.join("lib/sample_attachments/bigfile.pdf")
    )
    page.attach_file(
        "insurance_card",
        Rails.root.join("lib/sample_attachments/sun.jpg")
      )
    fill_out_app
    click_on "Submit Application"
    expect(page).to have_content ("Uploaded file may only be a .pdf, .doc," +
      " or .docx file")
  end
end
