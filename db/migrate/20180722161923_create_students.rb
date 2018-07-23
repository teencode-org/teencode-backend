class CreateStudents < ActiveRecord::Migration[5.0]
  def change
    create_table :students do |t|
      t.string :name, null: false
      t.string :level
      t.string :gender
      t.references :parent, foreign_key: true
      t.references :school, foreign_key: true

      t.timestamps
    end
  end
end
