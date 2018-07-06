class ChatroomController < ApplicationController
  def index
    @messages = Message.order(created_at: :asc)
    @message = Message.new
  end
end
