require "rails_helper"

RSpec.describe ApplicantMailer, type: :mailer do
  describe 'welcome_email' do
    it 'renders the subject' do
      user = build_stubbed_user
      mail = ApplicantMailer.welcome_email(user.id).deliver_now

      expect(mail.subject).to eq('Welcome to Teencode')
    end

    it 'renders the receiver email' do
      user = build_stubbed_user
      mail = ApplicantMailer.welcome_email(user.id).deliver_now

      expect(mail.to).to eq([user.email])
    end

    it 'renders the sender email' do
      user = build_stubbed_user
      mail = ApplicantMailer.welcome_email(user.id).deliver_now

      expect(mail.from).to eq(['no-reply@teencode.com'])
    end

    it 'sends an email' do
      user = build_stubbed_user
      mail = ApplicantMailer.welcome_email(user.id)

      expect { mail.deliver_now }
        .to change { ActionMailer::Base.deliveries.count }.by(1)
    end
  end

  describe "admin_applicant_email" do
    it "renders the subject" do
      applicant = build_stubbed_user
      mail = ApplicantMailer.admin_applicant_email(
        applicant_id: applicant.id
      ).deliver_now

      expect(mail.subject).to eq("[Feedback] A user wants to be part of teencode")
    end

    it "renders the receivers of the email" do
      applicant = build_stubbed_user
      mail = ApplicantMailer.admin_applicant_email(
        applicant_id: applicant.id
      ).deliver_now

      expect(mail.to).to eq([ApplicantMailer::TEENCODEADMINEMAIL])
      expect(mail.cc).to eq(ApplicantMailer::TEAMLEADS)
    end

    it "renders the sender" do
      applicant = build_stubbed_user
      mail = ApplicantMailer.admin_applicant_email(
        applicant_id: applicant.id
      ).deliver_now

      expect(mail.from).to eq([applicant.email])
    end
    it "sends the email" do
      applicant = build_stubbed_user
      mail = ApplicantMailer.admin_applicant_email(
        applicant_id: applicant.id
      )

      expect { mail.deliver_now }
      .to change { ActionMailer::Base.deliveries.count }.by(1)
    end

  end

  def build_stubbed_user
    user = build_stubbed(:applicant)
    allow(Applicant).to receive(:find).and_return(user)
    user
  end
end
