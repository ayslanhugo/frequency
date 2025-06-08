class PasswordsMailer < ApplicationMailer
  def reset(user)
    @user = user
    mail subject: "Reinicie sua senha", to: user.email_address
  end
end
