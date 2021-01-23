class ClimbingTypesController < ApplicationController
  
  def new
    climbing_type = ClimbingType.new
  end
  
  
  def create
    climbing_type = ClimbingType.new(climbing_type_params)
    climbing_type.save
  end

  def climbing_type_params
    params.require(:climbing_type).permit(climbing_type:[])
  end
end
