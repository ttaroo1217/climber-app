class ClimbingType < ApplicationRecord
  has_many :users_climbing_types
  has_many :users, through: :users_climbing_types

  enum climbing_types: { ボルダリング: 1, リードクライミング: 2, トップロープ: 3 }
end
