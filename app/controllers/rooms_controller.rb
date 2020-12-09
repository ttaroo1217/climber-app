class RoomsController < ApplicationController
  def index
    # binding.pry
    @user = User.find_by(id: params[:user_id])
    # @follows = current_user.active_relationships.where(follower_id: @users)
    @follow = current_user.active_relationships.find_by(follower_id: params[:user_id])
  end
  
  def new
    @room = Room.new
  end
<<<<<<< Updated upstream
=======

  def create
    # binding.pry
    @room = Room.new
    @room.save
    # @room = Room.find(id)
    # if @room.save
    #   redirect_to root_path
    # else
    #   render :new
    # end
  end

  def destroy
    room = Room.find(params[:id])
    room.destroy
    redirect_to root_path
  end

  
>>>>>>> Stashed changes
end
