class MessagesController < ApplicationController
  def create
    @chatroom = Chatroom.find(params[:chatroom_id])
    @message = Message.new(message_params)
    @message.chatroom = @chatroom
    @message.user = current_user
    if @message.save
      ChatroomChannel.broadcast_to(
        @chatroom,
        {
          authorId: @message.user.id,
          elementToAppend: render_to_string(partial: "message", locals: {message: @message, author: false})
        }.to_json
      )
      head :ok
    else
      render "chatrooms/show", status: :unprocessable_entity
    end
  end

  def show
    @message = Message.find(params[:id])
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
