class UserMailer < ActionMailer::Base
  default from: "stan@stanmartineau.com"
  layout 'email'
  def welcome(user)
    @user = user 
    mail(to: user.email, subject: 'Welcome')
  end
end
