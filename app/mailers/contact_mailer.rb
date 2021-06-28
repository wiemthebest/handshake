class ContactMailer < ApplicationMailer

  
  default from: 'wiem2007@gmail.com'

    def contact_form(contact)
      @contact = contact
      admins_emails = User.admin.pluck(:email)
      mail(from: contact.email, to: 'wiem2007@gmail.com', subject: "Contact from #{contact.first_name} #{contact.last_name}")
    end

end