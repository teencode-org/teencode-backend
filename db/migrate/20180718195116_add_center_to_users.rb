class AddCenterToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :center, :string
    add_column :users, :location, :string
  end
end
