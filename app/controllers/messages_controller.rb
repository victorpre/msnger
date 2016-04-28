class MessagesController < ApplicationController
  before_filter :authenticate_user!

  include MessagesHelper

  def create
    @conversation = Conversation.find(params[:conversation_id])
    @message = @conversation.messages.build(message_params)
    @message.sender_id = current_user.id
    @message.recipient_id = message_interlocutor_id(@message)
    @message.save!

    
    notify_unread
    
    
    @path_sender = conversation_path(@conversation)+"/#{@message.sender_id}"
    @path_recipient = conversation_path(@conversation)+"/#{@message.recipient_id}"
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end

  def notify_unread
    js_code = "$('##{@conversation.id}-msg-count').text(#{@conversation.unread_msg_count(@message.recipient_id)});"
    js_code += "$('##{@conversation.id}-msg-count').show();"
    PrivatePub.publish_to("/conversations/notify/#{@conversation.id}/#{@message.recipient_id}", js_code)
  end
end
