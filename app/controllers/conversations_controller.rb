class ConversationsController < ApplicationController
  before_filter :authenticate_user!

  layout false
  # Creates conversation box
  def create
    if Conversation.between(params[:user1_id],params[:user2_id]).present?
      @conversation = Conversation.between(params[:user1_id],params[:user2_id]).first
      # @messages = @conversation.messages.where(read:false).update_all(read: true) # maybe change
    else
      @conversation = Conversation.create!(conversation_params)
    end

    render json: { conversation_id: @conversation.id }
  end

  def show
    @conversation = Conversation.find(params[:id])
    @receiver = interlocutor(@conversation)
    @messages = @conversation.messages
    @message = Message.new
  end

  def read
    @conversation = Conversation.find(params[:conversation_id])
    if @conversation.unread_messages.any?
      @conversation.read_messages!
    end
    render :nothing => true
  end

  private
  def conversation_params
    params.permit(:user1_id, :user2_id)
  end

  def interlocutor(conversation)
    current_user == conversation.user2 ? conversation.user1 : conversation.user2
  end
end
