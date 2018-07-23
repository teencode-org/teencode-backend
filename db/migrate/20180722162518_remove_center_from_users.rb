class RemoveCenterFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :center, :string
    remove_column :users, :level, :string
    remove_column :users, :location, :string
    remove_column :users, :type, :string
  end
end
