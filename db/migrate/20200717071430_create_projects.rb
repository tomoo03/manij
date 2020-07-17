class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :title, null: false
      t.string :phase_title
      t.timestamps
    end
  end
end
