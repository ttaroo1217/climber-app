class MessagesController < RoomsController
  def index
    #  binding.pry
     @user = User.find(params[:user_id])
     @messages = Message.all
  end

  def new
     @messages = Message.all
     @message = Message.new
  end
  
  def create
    @message = Message.new(message_params)
    @message.save
    if @message.save
      ActionCable.server.broadcast 'message_channel', content: @message
    end
  end

  private

  def message_params
    params.permit(:content, :room_id).merge(user_id: current_user.id)
  end
  
end
