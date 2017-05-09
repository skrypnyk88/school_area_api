class ResetPasswordMailer < ApplicationMailer
  default from: ENV['GMAIL_USERNAME']
  default template_path: 'v1/users/mailer'

  def reset_password_instructions(user)
    I18n.locale = user.locale
    @user = user
    mail(to: @user.email,
         subject: I18n.t('mailer.reset_password_instructions_subject'))
  end
end
