class CreatePhases < ActiveRecord::Migration[6.0]
  def change
    create_table :phases do |t|
      t.string :title, null: false
      t.integer :goal_id
      t.timestamps
    end
  end
end
