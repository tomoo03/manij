class CreateProjectComments < ActiveRecord::Migration[6.0]
  def change
    create_table :project_comments do |t|
      t.string :content, null: false
      t.integer :project_phase_id
      t.integer :user_id
      t.timestamps
    end
  end
end
