class CreateProjectMinds < ActiveRecord::Migration[6.0]
  def change
    create_table :project_minds do |t|
      t.string :title, null: false
      t.integer :project_id
      t.timestamps
    end
  end
end
