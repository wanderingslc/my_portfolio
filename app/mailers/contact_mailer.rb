class ContactMailer < ActionMailer::Base
  layout 'email'

  default from: "from@example.com"
  default to: "stan.martineau@gmail.com"

  def contact_message(message)
    @message = message
    mail(subject: "[Portfolio Website] #{message.subject}")
  end
  
end
