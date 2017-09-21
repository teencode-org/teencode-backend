class CreateJoinTableLessonNoteAdminUser < ActiveRecord::Migration[5.0]
  def change
    create_join_table :lesson_notes, :admin_users do |t|
      t.index [:lesson_note_id, :admin_user_id], name: "note_user"
    end
  end
end
