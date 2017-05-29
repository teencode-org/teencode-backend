class RemoveLinkFromResources < ActiveRecord::Migration[5.0]
  def change
    remove_column :resources, :link, :string
  end
end
