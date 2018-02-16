class DeveloperMailer < ApplicationMailer
  def api_key_email(user)
    @user = user
    mail(to: @user.email, subject: 'Your HomeBodies API Key')
  end
end
