class ResetPasswordMailer < ApplicationMailer
  default from: 'takecare.user@gmail.com'
  default template_path: 'v1/users/mailer'

  def reset_password_instructions(user)
    @user = user
    mail(to: @user.email,
         subject: I18n.t('mailer.reset_password_instructions_subject'))
  end
end
