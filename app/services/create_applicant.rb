class CreateApplicant
  include ActiveModel::Model

  attr_accessor :name, :profession, :reason_for_applying, :phone_number, :email, :applicant

  def save
    @applicant = Applicant.new(
      name: name,
      profession: profession,
      reason_for_applying: reason_for_applying,
      phone_number: phone_number,
      email: email
    )
    persist
  end

  private

  def persist
    if applicant.save
      dispatch_emails
      true
    else
      false
    end
  end

  def dispatch_emails
    ApplicantMailer.welcome_email(applicant.id).deliver_later
    ApplicantMailer.admin_applicant_email(applicant_id: applicant.id).deliver_later
  end
end
