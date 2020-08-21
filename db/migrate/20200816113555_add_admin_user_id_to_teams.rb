class AddAdminUserIdToTeams < ActiveRecord::Migration[6.0]
  def change
    add_column :teams, :admin_user_id, :integer, null: false, default: 1
    change_column_default :teams, :admin_user_id, nil
  end
end
