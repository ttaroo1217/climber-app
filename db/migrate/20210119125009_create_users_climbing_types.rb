class CreateUsersClimbingTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :users_climbing_types do |t|
      t.references :user, foreign_key: true
      t.references :climbing_type, foreign_key: true
      t.timestamps
    end
  end
end
