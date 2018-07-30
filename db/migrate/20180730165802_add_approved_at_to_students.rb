class AddApprovedAtToStudents < ActiveRecord::Migration[5.0]
  def change
    add_column :students, :approved_at, :datetime
    add_column :students, :approved_by, :integer
  end
end
