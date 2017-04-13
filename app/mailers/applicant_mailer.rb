class ApplicantMailer < ApplicationMailer
  default from: 'no-reply@teencode.com'

  def welcome_email(id)
    @user = User.find(id)
    mail(to: user.email, subject: "Welcome to Teencode")
  end
end
