# app/models/user.rb
class User < ApplicationRecord
  # --- SEGURANÇA E RELACIONAMENTOS ---
  has_secure_password
  has_many :sessions, dependent: :destroy

  # --- NORMALIZAÇÃO DE DADOS ---
  normalizes :email_address, with: ->(e) { e.strip.downcase }

  # --- VALIDAÇÕES ---
  validates :email_address,
            # Mensagem para o caso de o campo estar em branco.
            presence: { message: "não pode ficar em branco." },

            # Mensagem para o caso de o e-mail já existir.
            uniqueness: { case_sensitive: false, message: "já está em uso. Por favor, escolha outro." },

            # Você já tinha esta mensagem, ela será mantida.
            format: { with: URI::MailTo::EMAIL_REGEXP, message: "não possui um formato válido." }

  # --- MÉTODOS AUXILIARES ---
  def admin?
    is_admin
  end
end
