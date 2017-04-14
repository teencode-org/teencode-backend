class CreateObjectives < ActiveRecord::Migration[5.0]
  def change
    create_table :objectives do |t|
      t.references :session, foreign_key: true
      t.text :description

      t.timestamps
    end
  end
end
