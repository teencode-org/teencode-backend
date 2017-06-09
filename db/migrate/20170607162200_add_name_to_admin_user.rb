class AddNameToAdminUser < ActiveRecord::Migration[5.0]
  def change
    add_column :admin_users, :first_name, :string
    add_column :admin_users, :last_name, :string
  end
end
