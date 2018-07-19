class RenameTypeToSchoolType < ActiveRecord::Migration[5.0]
  def change
    rename_column :schools, :type, :school_type
    remove_column :schools, :center, :string
  end
end
