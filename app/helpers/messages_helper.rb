module MessagesHelper
  def self_or_other(message)
  
    message.sender == current_user ? "self" : "other"
  end

  def message_interlocutor(message)
    message.sender == message.conversation.user1 ? message.conversation.user2 : message.conversation.user1
  end

  def message_interlocutor_id(message)
    message.sender_id == message.conversation.user1_id ? message.conversation.user2_id : message.conversation.user1_id
  end
end