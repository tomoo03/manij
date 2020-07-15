class AddPhaseIdToTasks < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :phase_id, :integer
  end
end
