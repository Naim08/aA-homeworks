class UserMailer < ApplicationMailer
  def welcome_email(user)
    @user = user
    mail(to: "mmiah@fordham.edu", subject: 'Welcome to My Awesome Site')
  end
end
