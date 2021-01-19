class CreateClimbingTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :climbing_types do |t|
      t.integer :climbing_type
      t.timestamps
    end
  end
end
