# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2023_11_30_190839) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "languages", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lessons", force: :cascade do |t|
    t.string "title"
    t.string "body"
    t.bigint "users_id"
    t.bigint "languages_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["languages_id"], name: "index_lessons_on_languages_id"
    t.index ["users_id"], name: "index_lessons_on_users_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "role_title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "user_name", null: false
    t.bigint "roles_id", null: false
    t.bigint "languages_id"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["languages_id"], name: "index_users_on_languages_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["roles_id"], name: "index_users_on_roles_id"
  end

  add_foreign_key "lessons", "languages", column: "languages_id"
  add_foreign_key "lessons", "users", column: "users_id"
  add_foreign_key "users", "languages", column: "languages_id"
  add_foreign_key "users", "roles", column: "roles_id"
end
