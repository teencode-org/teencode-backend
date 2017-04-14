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

  def attributes
    applicant.attributes
  end

  private

  def persist
    if applicant.save
      send_welcome_email(applicant)
      true
    else
      false
    end
  end

  def send_welcome_email(applicant)
    ApplicantMailer.welcome_email(applicant.id).deliver_later(wait: 15.seconds)
  end
end
