class CreateSchools < ActiveRecord::Migration[5.0]
  def change
    create_table :schools do |t|
      t.string :name
      t.string :address
      t.references :lead_facilitator, index: true, foreign_key: { to_table: :users }
      t.boolean :is_active

      t.timestamps
    end
    add_index :schools, :name
  end
end
