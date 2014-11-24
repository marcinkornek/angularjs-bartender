class UserMailer < ActionMailer::Base
  default from: "no-reply@blog3.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.activation_needed_email.subject
  #
  def activation_needed_email(user)
    @user = user
    # @url  = "http://0.0.0.0:3000/api/users/#{user.activation_token}/activate"
    @url = activate_api_user_url(user.activation_token)
    mail(:to => user.email,
         :subject => "Welcome to My Awesome Site")
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.activation_success_email.subject
  #
  def activation_success_email(user)
    @user = user
    @url  = "http://0.0.0.0:3000/login"
    mail(:to => user.email,
         :subject => "Your account is now activated")
  end
end
