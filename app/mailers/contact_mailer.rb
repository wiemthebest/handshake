class ContactMailer < ApplicationMailer
  def contact_form(contact)
    @contact = contact
    admins_emails = User.admin.pluck(:email)
    mail(to: contact.email, to: 'hareish3@gmail.com', subject: "Contact from #{contact.first_name} #{contact.last_name}")
  end
end