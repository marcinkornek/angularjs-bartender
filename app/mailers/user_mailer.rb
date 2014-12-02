class UserMailer < ActionMailer::Base
  default from: "no-reply@bartender-app.herokuapp.com"

  def activation_needed_email(user)
    @user = user
    # @url  = "http://0.0.0.0:3000/api/users/#{user.activation_token}/activate"
    @url = activate_api_user_url(user.activation_token)
    mail(:to => user.email,
         :subject => t("mailer.welcome_email.welcome_subject")
        )
  end

end
