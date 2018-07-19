class AddTypeToSchools < ActiveRecord::Migration[5.0]
  def change
    add_column :schools, :type, :string, null: false
    add_column :schools, :location, :string, null: false
  end
end
