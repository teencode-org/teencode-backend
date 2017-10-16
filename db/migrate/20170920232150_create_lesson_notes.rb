class CreateLessonNotes < ActiveRecord::Migration[5.0]
  def up
    remove_index :admin_users_facilitator_guides, name: "guide_user"
    remove_column :facilitator_guides, :session
    create_table :lesson_notes do |t|
      t.string :title
      t.string :level
      t.references :session, foreign_key: true
      t.string :intro_video
      t.text :body

      t.timestamps
    end
  end

  def down
    add_index :admin_users_facilitator_guides, name: "guide_user"
    add_column :facilitator_guides, :session, :integer
    drop_table :lesson_notes
  end
end
