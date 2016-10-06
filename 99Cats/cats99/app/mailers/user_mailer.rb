class UserMailer < ApplicationMailer
  default from: 'everybody@appacademy.io'

  def welcome_email(user)
    @user = user
    @url = "cats.com"
    mail(to: user.email, subject: 'Welcome!')
  end

  

end
