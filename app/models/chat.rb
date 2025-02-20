class Chat < ApplicationRecord
  belongs_to :application :foreign_key => :application_id
  has_many :messages

  # before_create :set_chat_number

  # private

  # def set_chat_number
  #   self.number = (self.application.chats.maximum(:number) || 0) + 1
  # end

  def self.get_chat_number(application_uuid, increment = true )
    @mutex = Mutex.new
    begin
      @number_of_chats = REDIS.get('APP'.concat('-',application_uuid)).to_i + 1
      increment ? REDIS.set('APP'.concat('-',application_uuid), @number_of_chats) : ''
    ensure
      @mutex.unlock rescue nil
    end

    @number_of_chats
  end
end
