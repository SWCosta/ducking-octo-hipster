class RegistrationMailer < ActionMailer::Base
  default from: "hate@fucklove.de"

  def wait_for_activation_email(user)
    @user = user
    @url = url
    mail(:to => @user.email, :subject => "Welcome to fucklove.de")
  end

  def welcome_email(user, password)
    @user = user
    @url = url
    @password = password
    @password_url = @url + "/users/password/edit"
    mail(:to => @user.email, :subject => "Welcome to fucklove.de")
  end

  def activated_email(user)
    @user = user
    @url = url
    mail(:to => @user.email, :subject => "Welcome to fucklove.de")
  end

  private

  def url
    "http://www.fucklove.de"
  end

end
