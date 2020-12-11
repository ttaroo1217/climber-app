class MessagesController < RoomsController
  def index
    #  binding.pry
     @user = User.find(params[:user_id])
    #  @message = Message.new
     @room = RoomUser.find_by(user_id: params[:user_id])
     @messages = Message.all
  end

  def new
     @messages = Message.all
     @message = Message.new
  end
  
  def create
    @message = Message.new(text: params[:message][:text])
  end
end
