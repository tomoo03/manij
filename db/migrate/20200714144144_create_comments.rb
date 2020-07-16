class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :content, null: false
      t.integer :phase_id
      t.timestamps
    end
  end
end
