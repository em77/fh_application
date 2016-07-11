require "rails_helper"

RSpec.describe AppMailerMailer, type: :mailer do
  describe "new_app_email" do
    let(:mail) { AppMailerMailer.new_app_email }

    it "renders the headers" do
      expect(mail.subject).to eq("New app email")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
