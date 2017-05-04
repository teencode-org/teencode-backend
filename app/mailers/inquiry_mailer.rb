class InquiryMailer < ApplicationMailer

  def admin_inquiry_email(inquiry_id:)
    @inquiry = Inquiry.find(inquiry_id)
    mail(
      to: TEENCODEADMINEMAIL,
      subject: "[Feedback] A user reaching out",
      from: @inquiry.email
    )
  end

  def user_contact_us_reply_email(user_email:, user_name:)
    @user_name = user_name
    mail(
      to: user_email,
      from: TEENCODEADMINEMAIL,
      subject: "Thank you for reaching out to us"
      )
  end
end
