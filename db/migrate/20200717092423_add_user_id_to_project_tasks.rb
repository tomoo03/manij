class AddUserIdToProjectTasks < ActiveRecord::Migration[6.0]
  def change
    add_column :project_tasks, :user_id, :integer
  end
end
