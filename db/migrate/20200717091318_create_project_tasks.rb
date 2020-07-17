class CreateProjectTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :project_tasks do |t|
      t.string :title, null: false
      t.boolean :task_flg, null: false
      t.integer :project_phase_id
      t.timestamps
    end
  end
end
