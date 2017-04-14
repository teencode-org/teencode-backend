class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.references :session, foreign_key: true
      t.text :description
      t.string :title

      t.timestamps
    end
  end
end
