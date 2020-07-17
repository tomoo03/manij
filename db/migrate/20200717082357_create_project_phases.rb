class CreateProjectPhases < ActiveRecord::Migration[6.0]
  def change
    create_table :project_phases do |t|
      t.string :title, null: false
      t.integer :project_id
      t.timestamps
    end
  end
end
