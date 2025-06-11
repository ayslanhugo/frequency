class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy

  normalizes :email_address, with: ->(e) { e.strip.downcase }

  def admin?
    is_admin
  end

  validates :email_address, presence: true, uniqueness: { case_sensitive: false }

  # É uma boa prática também validar o formato do e-mail
  validates :email_address, format: { with: URI::MailTo::EMAIL_REGEXP, message: "formato inválido" }

  # Outras validações e lógicas do seu modelo...
  has_secure_password
end
