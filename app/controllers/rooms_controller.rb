class RoomsController < ApplicationController
  def index
    # binding.pry
    # @room_current_users = RoomUser.where(user_id: current_user.id)
    @follow = current_user.active_relationships.find_by(follower_id: params[:user_id])
    @room_current_user  = current_user.rooms.ids
    @user = User.find_by(id: params[:user_id])
    @room_user  = @user.rooms.ids
    @room_match = @room_current_user & @room_user
  end
  
  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to user_messages_path(room_id: @room.id)
    else
      render :index
    end 
  end

  def room_params
    params.require(:room).permit(user_ids:[])
  end

  def room_user
    params[:user_id]
    params[:@room_match] 
  end
  
end
