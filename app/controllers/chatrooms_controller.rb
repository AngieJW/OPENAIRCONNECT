class ChatroomsController < ApplicationController
  def show
    @event = Event.find(params[:event_id])
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end
end
