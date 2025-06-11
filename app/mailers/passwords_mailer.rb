class PasswordsMailer < ApplicationMailer
  def reset(user:, token:)
    @user = user
    @token = token
    mail to: @user.email_address, subject: "Redefinição de Senha - Frequency JCC"
  end
end
