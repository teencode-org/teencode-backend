class ApplicationMailer < ActionMailer::Base
  default from: 'no-reply@teencodeafrica.com'
  TEAMLEADS = [
    'munachimso.ugorji@andela.com',
    'oluwadamilola.durodola@andela.com',
    'tonida.baraza@andela.com',
    'moyosore.sosan@andela.com',
    'william.olojede@andela.com',
    'paul.musisi@andela.com',
    'austin.roy@andela.com',
    'abdulqahhar.aminujatto@andela.com',
    'loice.andia@andela.com',
    'godwin.onisofien@andela.com'
  ].freeze

  TEENCODEADMINEMAIL = 'teencodeafrica@gmail.com'.freeze
  layout 'mailer'
end
