class AddTitleToObjectives < ActiveRecord::Migration[5.0]
  def change
    add_column :objectives, :title, :string
  end
end
