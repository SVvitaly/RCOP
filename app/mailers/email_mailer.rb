class EmailMailer < ApplicationMailer
  default from: "info@row.by", template_path: 'email_mailer/email'

  def email_created(email)
    @email = email
    mail to: 'rcop_grebn_v@tut.by',
            subject: "Email created"
  end
end
