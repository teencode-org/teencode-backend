class CreateResources < ActiveRecord::Migration[5.0]
  def change
    create_table :resources do |t|
      t.references :session, foreign_key: true
      t.text :description
      t.string :link

      t.timestamps
    end
  end
end
