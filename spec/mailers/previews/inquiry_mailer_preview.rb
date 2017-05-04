# Preview all emails at http://localhost:3000/rails/mailers/inquiry
class InquiryMailerPreview < ActionMailer::Preview
  def admin_inquiry_email
    inquiry = Inquiry.last
    InquiryMailer.admin_inquiry_email(inquiry_id: inquiry.id)
  end

  def user_contact_us_reply_email
    InquiryMailer.user_contact_us_reply_email(
      user_email: "olalekan@andela.com",
      user_name: "olalekan"
    )
  end
end
