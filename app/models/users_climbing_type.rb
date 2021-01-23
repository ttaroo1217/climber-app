class UsersClimbingType < ApplicationRecord
  belongs_to :user
  belongs_to :climbing_type
end
