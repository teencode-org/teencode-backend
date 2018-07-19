class CreateInquiry
  include ActiveModel::Model

  attr_accessor :phone_number, :email, :message, :name, :inquiry

  def save
    @inquiry = Inquiry.new(
      name: name,
      phone_number: phone_number,
      email: email,
      message: message
    )
    persist
  end

  private

  def persist
    if inquiry.save
      handle_suceess
    else
      handle_failure
    end
  end

  def promote_errors(child_errors)
    child_errors.each do |attribute, message|
      errors.add(attribute, message)
    end
  end

  def handle_suceess
    dispatch_emails
    true
  end

  def handle_failure
    promote_errors(inquiry.errors)
    false
  end

  def dispatch_emails
    InquiryMailer.admin_inquiry_email(inquiry_id: inquiry.id).deliver_later
    InquiryMailer.user_contact_us_reply_email(
      user_email: email,
      user_name: name
    ).deliver_later
  end
end
