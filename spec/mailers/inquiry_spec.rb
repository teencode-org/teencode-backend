require "rails_helper"

RSpec.describe InquiryMailer, type: :mailer do
    describe "admin_inquiry_email" do
      it "renders the subject" do
        inquiry = stubbed_inquiry
        mail = InquiryMailer.admin_inquiry_email(
          inquiry_id: inquiry.id
        ).deliver_now

        expect(mail.subject).to eq("[Feedback] A user reaching out")
      end

      it "renders the receivers of the email" do
        inquiry = stubbed_inquiry
        mail = InquiryMailer.admin_inquiry_email(
          inquiry_id: inquiry.id
        ).deliver_now

        expect(mail.to).to eq([InquiryMailer::TEENCODEADMINEMAIL])
        expect(mail.cc).to eq(InquiryMailer::TEAMLEADS)
      end

      it "renders the sender" do
        inquiry = stubbed_inquiry
        mail = InquiryMailer.admin_inquiry_email(
          inquiry_id: inquiry.id
        ).deliver_now

        expect(mail.from).to eq([inquiry.email])
      end
      it "sends the email" do
        inquiry = stubbed_inquiry
        mail = InquiryMailer.admin_inquiry_email(
          inquiry_id: inquiry.id
        )

        expect { mail.deliver_now }
        .to change { ActionMailer::Base.deliveries.count }.by(1)
      end

    end

  describe "#user_contact_us_reply_email" do
    let(:mail) { InquiryMailer.user_contact_us_reply_email(
      user_name: user_name,
      user_email: user_email
    ).deliver_now
  }

  let(:user_email) { "test@example.com" }

  let(:user_name) { "Olalekan" }
    it "renders the subject" do
      expect(mail.subject).to eq("Thank you for reaching out to us")
    end

    it "renders the sender" do
      expect(mail.from).to eq([InquiryMailer::TEENCODEADMINEMAIL])
    end

    it "renders the receiver" do
      expect(mail.to).to eq([user_email])
    end

    it "sends the email" do
      expect {mail}.to change { ActionMailer::Base.deliveries.count }.by(1)
    end
  end

    def stubbed_inquiry
      inquiry = build_stubbed(:inquiry)
      allow(Inquiry).to receive(:find).and_return(inquiry)
      inquiry
    end
end
