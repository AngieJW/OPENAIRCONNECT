class MessagesController < ApplicationController
  def create
    @chatroom = Chatroom.find(params[:chatroom_id])
    @message = Message.new(message_params)
    @message.chatroom = @chatroom
    @message.user = current_user
    if @message.save
      redirect_to event_chatroom_path(@chatroom.event, @chatroom)
    else
      render "chatrooms/show", status: :unprocessable_entity
    end
  end

  def destroy
    @message = Message.find(params[:id])
    puts "Found message: #{@message.inspect}"
    @message.destroy
    puts "Message after destroy: #{@message.inspect}"
    redirect_to event_chatroom_path(@message.chatroom.event, @message.chatroom)
  end

  def show
    @message = Message.find(params[:id])
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
