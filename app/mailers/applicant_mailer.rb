class ApplicantMailer < ApplicationMailer
  default from: 'no-reply@teencode.com'

  def welcome_email(id)
    @user = Applicant.find(id)
    mail(to: @user.email, subject: "Welcome to Teencode")
  end

  def admin_applicant_email(applicant_id:)
    @applicant = Applicant.find(applicant_id)
    mail(
      to: TEENCODEADMINEMAIL,
      cc: TEAMLEADS,
      subject: "[Feedback] A user wants to be part of teencode",
      from: @applicant.email
    )
  end
end
