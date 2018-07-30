# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180730165802) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.string   "author_type"
    t.integer  "author_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree
  end

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "first_name"
    t.string   "last_name"
    t.boolean  "super_user",             default: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "admin_users_facilitator_guides", id: false, force: :cascade do |t|
    t.integer "admin_user_id",        null: false
    t.integer "facilitator_guide_id", null: false
    t.index ["admin_user_id", "facilitator_guide_id"], name: "user_guide", using: :btree
  end

  create_table "admin_users_lesson_notes", id: false, force: :cascade do |t|
    t.integer "lesson_note_id", null: false
    t.integer "admin_user_id",  null: false
    t.index ["lesson_note_id", "admin_user_id"], name: "note_user", using: :btree
  end

  create_table "applicants", force: :cascade do |t|
    t.string   "name"
    t.string   "profession"
    t.text     "reason_for_applying"
    t.string   "phone_number"
    t.string   "email"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "blogs", force: :cascade do |t|
    t.integer  "author_id"
    t.string   "title"
    t.text     "story"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "featured_image_url"
    t.boolean  "featured"
  end

  create_table "facilitator_guides", force: :cascade do |t|
    t.string   "title"
    t.string   "level"
    t.string   "intro_video"
    t.text     "body"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "session_id"
    t.index ["session_id"], name: "index_facilitator_guides_on_session_id", using: :btree
  end

  create_table "inquiries", force: :cascade do |t|
    t.string   "email"
    t.string   "phone_number"
    t.text     "message"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "name"
  end

  create_table "lesson_notes", force: :cascade do |t|
    t.string   "title"
    t.string   "level"
    t.integer  "session_id"
    t.string   "intro_video"
    t.text     "body"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["session_id"], name: "index_lesson_notes_on_session_id", using: :btree
  end

  create_table "notes", force: :cascade do |t|
    t.text     "description"
    t.string   "link"
    t.string   "notable_type"
    t.integer  "notable_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["notable_type", "notable_id"], name: "index_notes_on_notable_type_and_notable_id", using: :btree
  end

  create_table "objectives", force: :cascade do |t|
    t.integer  "session_id"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "title"
    t.index ["session_id"], name: "index_objectives_on_session_id", using: :btree
  end

  create_table "parents", force: :cascade do |t|
    t.string   "name",         null: false
    t.string   "email",        null: false
    t.string   "phone_number", null: false
    t.string   "center",       null: false
    t.string   "location",     null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "progresses", force: :cascade do |t|
    t.integer  "schools"
    t.integer  "students"
    t.integer  "countries"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: :cascade do |t|
    t.integer  "session_id"
    t.text     "description"
    t.string   "title"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["session_id"], name: "index_projects_on_session_id", using: :btree
  end

  create_table "reports", force: :cascade do |t|
    t.json     "data"
    t.integer  "quarter"
    t.integer  "user_id"
    t.integer  "school_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_reports_on_user_id", using: :btree
  end

  create_table "resources", force: :cascade do |t|
    t.integer  "session_id"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "title"
    t.index ["session_id"], name: "index_resources_on_session_id", using: :btree
  end

  create_table "schools", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.integer  "lead_facilitator_id"
    t.boolean  "is_active"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "school_type",         null: false
    t.string   "location",            null: false
    t.string   "center"
    t.index ["lead_facilitator_id"], name: "index_schools_on_lead_facilitator_id", using: :btree
    t.index ["name"], name: "index_schools_on_name", using: :btree
  end

  create_table "sessions", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "order"
  end

  create_table "students", force: :cascade do |t|
    t.string   "name",        null: false
    t.string   "level"
    t.string   "gender"
    t.integer  "parent_id"
    t.integer  "school_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.datetime "approved_at"
    t.integer  "approved_by"
    t.index ["parent_id"], name: "index_students_on_parent_id", using: :btree
    t.index ["school_id"], name: "index_students_on_school_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.boolean  "is_active"
    t.integer  "school_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "facilitator_guides", "sessions"
  add_foreign_key "lesson_notes", "sessions"
  add_foreign_key "objectives", "sessions"
  add_foreign_key "projects", "sessions"
  add_foreign_key "reports", "users"
  add_foreign_key "resources", "sessions"
  add_foreign_key "schools", "users", column: "lead_facilitator_id"
  add_foreign_key "students", "parents"
  add_foreign_key "students", "schools"
end
