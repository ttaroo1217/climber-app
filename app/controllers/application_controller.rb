class ApplicationController < ActionController::Base
  # before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  

  private
  # binding.pry
  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :self_introduction, :sex_id, :area_id, :weight_id, :climbing_type, :image])
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:name, :self_introduction, :sex_id, :area_id, :weight_id, :climbing_type, :image])
  # end

  
# climbing_typeあり
  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :self_introduction, :sex_id, :area_id, :weight_id, :climbing_type, :image])
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:name, :self_introduction, :sex_id, :area_id, :weight_id, :climbing_type, :image])
  # end

  def configure_permitted_parameters
    binding.pry
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :self_introduction, :sex_id, :area_id, :weight_id, :image])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :self_introduction, :sex_id, :area_id, :weight_id, :image])
  end

  def climbing_type_params
    params.require(:user).permit(climbing_types: [])
  end
end
