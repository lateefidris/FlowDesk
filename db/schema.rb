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

ActiveRecord::Schema[7.0].define(version: 2024_04_01_175425) do
  create_table "availabilities", force: :cascade do |t|
    t.integer "desk_id", null: false
    t.string "day_of_the_week"
    t.time "start_time"
    t.time "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["desk_id"], name: "index_availabilities_on_desk_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.integer "desk_id", null: false
    t.integer "service_id", null: false
    t.string "client_name"
    t.string "client_email"
    t.datetime "appointment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["desk_id"], name: "index_bookings_on_desk_id"
    t.index ["service_id"], name: "index_bookings_on_service_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.integer "desk_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["desk_id"], name: "index_categories_on_desk_id"
  end

  create_table "desks", force: :cascade do |t|
    t.string "name"
    t.text "bio"
    t.string "location"
    t.string "profile_picture"
    t.integer "professional_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["professional_id"], name: "index_desks_on_professional_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.float "price"
    t.integer "time_in_minutes"
    t.integer "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_services_on_category_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "username"
    t.string "first_name"
    t.string "last_name"
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "availabilities", "desks"
  add_foreign_key "bookings", "desks"
  add_foreign_key "bookings", "services"
  add_foreign_key "categories", "desks"
  add_foreign_key "desks", "users", column: "professional_id"
  add_foreign_key "services", "categories"
end
