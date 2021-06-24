class ContactMailer < ApplicationMailer
    def contact_form(contact)
    @contact = contact
    mail(from: contact.email, subject: "Contact from #{contact.first_name} #{contact.last_name}")
  end
end
