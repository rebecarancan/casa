# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_03_29_085225) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "casa_cases", force: :cascade do |t|
    t.string "case_number", null: false
    t.boolean "teen_program_eligible", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["case_number"], name: "index_casa_cases_on_case_number", unique: true
  end

  create_table "case_assignments", force: :cascade do |t|
    t.bigint "casa_case_id", null: false
    t.bigint "volunteer_id", null: false
    t.boolean "is_active", default: true, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["casa_case_id"], name: "index_case_assignments_on_casa_case_id"
    t.index ["volunteer_id"], name: "index_case_assignments_on_volunteer_id"
  end

  create_table "case_updates", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "casa_case_id", null: false
    t.string "update_type", null: false
    t.string "other_type_text"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["casa_case_id"], name: "index_case_updates_on_casa_case_id"
    t.index ["user_id"], name: "index_case_updates_on_user_id"
  end

  create_table "supervisor_volunteers", force: :cascade do |t|
    t.bigint "supervisor_id", null: false
    t.bigint "volunteer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["supervisor_id"], name: "index_supervisor_volunteers_on_supervisor_id"
    t.index ["volunteer_id"], name: "index_supervisor_volunteers_on_volunteer_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "role", default: "volunteer", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "versions", force: :cascade do |t|
    t.string "item_type", null: false
    t.bigint "item_id", null: false
    t.string "event", null: false
    t.string "whodunnit"
    t.text "object"
    t.datetime "created_at"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
  end

  add_foreign_key "case_assignments", "casa_cases"
  add_foreign_key "case_assignments", "users", column: "volunteer_id"
  add_foreign_key "case_updates", "casa_cases"
  add_foreign_key "case_updates", "users"
  add_foreign_key "supervisor_volunteers", "users", column: "supervisor_id"
  add_foreign_key "supervisor_volunteers", "users", column: "volunteer_id"
end