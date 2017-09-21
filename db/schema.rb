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

ActiveRecord::Schema.define(version: 20170920233501) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.string   "author_type"
    t.integer  "author_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
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
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "admin_users_facilitator_guides", id: false, force: :cascade do |t|
    t.integer "admin_user_id",        null: false
    t.integer "facilitator_guide_id", null: false
    t.index ["admin_user_id", "facilitator_guide_id"], name: "user_guide"
  end

  create_table "admin_users_lesson_notes", id: false, force: :cascade do |t|
    t.integer "lesson_note_id", null: false
    t.integer "admin_user_id",  null: false
    t.index ["lesson_note_id", "admin_user_id"], name: "note_user"
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
    t.integer  "session"
    t.string   "intro_video"
    t.text     "body"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "session_id"
    t.index ["session_id"], name: "index_facilitator_guides_on_session_id"
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
    t.integer  "session"
    t.string   "intro_video"
    t.text     "body"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "notes", force: :cascade do |t|
    t.text     "description"
    t.string   "link"
    t.string   "notable_type"
    t.integer  "notable_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["notable_type", "notable_id"], name: "index_notes_on_notable_type_and_notable_id"
  end

  create_table "objectives", force: :cascade do |t|
    t.integer  "session_id"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "title"
    t.index ["session_id"], name: "index_objectives_on_session_id"
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
    t.index ["session_id"], name: "index_projects_on_session_id"
  end

  create_table "resources", force: :cascade do |t|
    t.integer  "session_id"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "title"
    t.index ["session_id"], name: "index_resources_on_session_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "order"
  end

end
