class CreateLessonNotes < ActiveRecord::Migration[5.0]
  def change
    remove_index :admin_users_facilitator_guides, name: "guide_user"
    create_table :lesson_notes do |t|
      t.string :title
      t.string :level
      t.integer :session
      t.string :intro_video
      t.text :body

      t.timestamps
    end
  end
end
