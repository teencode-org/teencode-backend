class SummerClubMailer < ApplicationMailer
  def registration_success(parent_id)
    @parent = Parent.find(parent_id)

    mail(
      to: @parent.email,
      subject: 'Teencode Registration Successful',
      from: TEENCODEADMINEMAIL
    )
  end
end