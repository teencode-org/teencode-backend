class CreateBlogs < ActiveRecord::Migration[5.0]
  def change
    create_table :blogs do |t|
      t.integer :author_id
      t.string :title
      t.text :story

      t.timestamps
    end
  end
end
