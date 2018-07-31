class AddSlackDetailsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :display_name, :string
    add_column :users, :user_slack_id, :string
    add_index :users, :user_slack_id, unique: true
    add_column :users, :user_team_id, :string
    add_index :users, :user_team_id, unique: true
    add_column :users, :user_access_token, :string
    add_index :users, :user_access_token, unique: true
  end
end
