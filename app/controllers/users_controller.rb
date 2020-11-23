class UsersController < ApplicationController

  def index
  end

  def show
    @user = User.find(params[:id])
  end

  # def update
  #   if current_user.update(user_params)
  #     redirect_to root_path
  #   else
  #     render :edit
  #   end
  # end

  # private

  # def user_params
  #   params.require(:user).permit(:name, :self_introduction, :sex_id, :area_id, :weight_id, :belay_exp_id, :climb_type, :image)
  # end
end
