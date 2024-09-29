class Message < ApplicationRecord
  belongs_to :chat

  before_create :set_message_number

  private

  def set_message_number
    self.number = (self.chat.messages.maximum(:number) || 0) + 1
  end
end
