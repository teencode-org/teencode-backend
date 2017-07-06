class AddOrderToSessions < ActiveRecord::Migration[5.0]
  def change
    add_column :sessions, :order, :integer
  end
end
