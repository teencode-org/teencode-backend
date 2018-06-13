# Preview all emails at http://localhost:3000/rails/mailers/applicant_mailer
class ApplicantMailerPreview < ActionMailer::Preview
  def admin_applicant_email
    applicant = Applicant.last
    ApplicantMailer.admin_applicant_email(applicant_id: applicant.id)
  end

  def welcome_email
    applicant = Applicant.last
    ApplicantMailer.welcome_email(applicant.id)
  end
end
