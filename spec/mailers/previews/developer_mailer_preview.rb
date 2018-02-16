# Preview all emails at http://localhost:3000/rails/mailers/developer_mailer
class DeveloperMailerPreview < ActionMailer::Preview
  def sample_mail_preview
     DeveloperMailer.api_key_email(User.all[1])
   end
end
