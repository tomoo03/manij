class CreateMinds < ActiveRecord::Migration[6.0]
  def change
    create_table :minds do |t|
      t.string :title, null: false
      t.integer :goal_id
      t.timestamps
    end
  end
end
