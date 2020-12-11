class RoomsController < ApplicationController
  def index
    @user = User.find_by(id: params[:user_id])
    @follow = current_user.active_relationships.find_by(follower_id: params[:user_id])
  end
  
  def new
    @room = Room.new
  end

  def create
    # binding.pry
    @room = Room.new(room_params)
    @room.save
    redirect_to user_messages_path
  end

  def room_params
    params.require(:room).permit(user_ids:[])
  end
end
