class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.boolean :is_active
      t.integer :school_id

      t.timestamps
    end
  end
end
