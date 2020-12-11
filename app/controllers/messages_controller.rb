class MessagesController < RoomsController
  def index
    # binding.pry
    @user = User.find(params[:user_id])
    @messages = Message.all
    # public_method(:create).super_method.call
  end

  def new
    # @message = Message.new
  end




  def create
    # binding.pry
    # @user = User.find(params[:user_id])
    # @user.save
    public_method(:create).super_method.call
    @message = Message.new(content: params[:content])
    @message.save
  end
end
