class CreateProgresses < ActiveRecord::Migration[5.0]
  def change
    create_table :progresses do |t|
      t.integer :schools
      t.integer :students
      t.integer :countries

      t.timestamps
    end
  end
end
