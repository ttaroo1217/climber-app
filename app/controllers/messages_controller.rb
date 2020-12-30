class MessagesController < RoomsController
  def index
    #  binding.pry
     @user = User.find(params[:user_id])
     @room = RoomUser.find_by(room_id: params[:room_id])
     @messages = Message.where(room_id: params[:room_id])
  end

  def new
     @messages = Message.all
     @message = Message.new
  end
  
  def create
    
    @message = Message.new(message_params)
    if @message.save
      ActionCable.server.broadcast 'message_channel', content: @message
      # binding.pry
    end
  end

  private

  def message_params
    params.permit(:content, :room_id).merge(user_id: current_user.id)
  end

end
