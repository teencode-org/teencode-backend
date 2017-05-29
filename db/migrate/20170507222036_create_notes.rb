class CreateNotes < ActiveRecord::Migration[5.0]
  def change
    create_table :notes do |t|
      t.text :description
      t.string :link
      t.references :notable, polymorphic: true

      t.timestamps
    end
  end
end
