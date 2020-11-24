class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    # @users = User.all
  end

  def edit
    @user = User.find(params[:id])
    unless  user_signed_in? && @user.id == current_user.id
      return redirect_to action: :index
    end
  end

  # ==============追加================
  def follows
    user = User.find(params[:id])
    @users = user.followings
  end

  def followers
    user = User.find(params[:id])
    @users = user.followers
  end
# ==============追加================

end
