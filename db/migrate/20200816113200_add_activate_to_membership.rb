class AddActivateToMembership < ActiveRecord::Migration[6.0]
  def change
    add_column :memberships, :activate, :boolean, default: false, null: false
  end
end
