# Preview all emails at http://localhost:3000/rails/mailers/summer_club_mailer
class SummerClubPreview < ActionMailer::Preview
  def registration_success
    parent = Parent.last
    SummerClubMailer.registration_success(parent.id)
  end
end