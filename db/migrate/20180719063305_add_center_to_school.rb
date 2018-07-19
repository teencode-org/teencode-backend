class AddCenterToSchool < ActiveRecord::Migration[5.0]
  def change
    add_column :schools, :center, :string
  end
end
