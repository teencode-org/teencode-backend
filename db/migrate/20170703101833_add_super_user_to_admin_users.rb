class AddSuperUserToAdminUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :admin_users, :super_user, :boolean, default: false
  end
end
