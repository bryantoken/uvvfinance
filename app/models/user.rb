class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  # Somente usuários aprovados podem fazer login
  def active_for_authentication?
    super && approved?
  end

  # Mensagem de erro para usuários não aprovados
  def inactive_message
    approved? ? super : :not_approved
  end
end
