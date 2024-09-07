class ContactMailer < ApplicationMailer
  def contact_email(name, subject, message)
    @name = name
    @message = message

    mail(to: 'seu_email@dominio.com', subject: subject)
  end
end
