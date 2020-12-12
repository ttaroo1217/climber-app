class UsersController < ApplicationController

  def index
    @users = User.all
    if user_signed_in?
      @follows = current_user.active_relationships.where(follower_id: @users)
    end
  end

  def show
    # binding.pry
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    unless  user_signed_in? && @user.id == current_user.id
      return redirect_to action: :index
    end
  end

  def follows
    user = User.find(params[:id])
    @users = user.followings
  end

  def followers
    user = User.find(params[:id])
    @users = user.followers
  end

end
