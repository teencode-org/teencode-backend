class CreateReports < ActiveRecord::Migration[5.0]
  def change
    create_table :reports do |t|
      t.json :data
      t.integer :quarter
      t.references :user, foreign_key: true
      t.integer :school_id

      t.timestamps
    end
  end
end
