class Notification < ApplicationRecord
  belongs_to :user

  scope :unread, -> { where(read: false) }

  def message
    # Implemente o código para retornar a mensagem da notificação
    # com base nos atributos existentes no seu modelo
    # Exemplo: return "Nova notificação: #{title}"
    return "Nova notificação: #{title}"
  end
end
