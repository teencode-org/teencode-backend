class AddTitleToResources < ActiveRecord::Migration[5.0]
  def change
    add_column :resources, :title, :string
  end
end
