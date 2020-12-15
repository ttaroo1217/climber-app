class MessagesController < RoomsController
  def index
    #  binding.pry
     @user = User.find(params[:user_id])
    #  @message = Message.new
    #  @room = RoomUser.find_by(user_id: params[:user_id]) 
     @room_user = RoomUser.find_by(user_id: params[:user_id])
     @room = RoomUser.find_by(room_id: current_user.room_ids)
     @room = RoomUser.find_by(room_id: params[:room_id])
    #  @room_user = RoomUser.find_by(user_id: params[:user_id])

     @messages = Message.all
  end

  def new
     @messages = Message.all
     @message = Message.new
    #  @room_current_user = RoomUser.find_by(user_id: current_user.id)
    #  @room_user = RoomUser.find_by(user_id: params[:user_id])
  end
  
  def create
    # binding.pry
    @message = Message.new(message_params)
    @message.save
    @room = RoomUser.find_by(user_id: params[:current_user_id])
    if @message.save
      ActionCable.server.broadcast 'message_channel', content: @message
    end
  end

  private

  def message_params
    params.permit(:content, :room_id).merge(user_id: current_user.id)
  end
  
end
