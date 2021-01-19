class ClimbingType < ApplicationRecord
  has_many :users_climbing_types
  has_many :users, through: :users_climbing_types
end
