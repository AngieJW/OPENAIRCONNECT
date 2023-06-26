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

ActiveRecord::Schema[7.0].define(version: 2023_06_26_130821) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chatrooms", force: :cascade do |t|
    t.string "messages"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.date "meeting_date"
    t.time "meeting_time"
    t.string "meeting_point"
    t.integer "group_size"
    t.boolean "swim"
    t.boolean "break"
    t.string "difficulty"
    t.text "description"
    t.bigint "hike_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "users_id", null: false
    t.index ["hike_id"], name: "index_events_on_hike_id"
    t.index ["users_id"], name: "index_events_on_users_id"
  end

  create_table "events_users", force: :cascade do |t|
    t.bigint "users_id", null: false
    t.bigint "event_id", null: false
    t.bigint "memory_id", null: false
    t.bigint "chatroom_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chatroom_id"], name: "index_events_users_on_chatroom_id"
    t.index ["event_id"], name: "index_events_users_on_event_id"
    t.index ["memory_id"], name: "index_events_users_on_memory_id"
    t.index ["users_id"], name: "index_events_users_on_users_id"
  end

  create_table "hikes", force: :cascade do |t|
    t.integer "distance"
    t.integer "elevation"
    t.time "duration"
    t.integer "starting_lat"
    t.integer "starting_lng"
    t.integer "ending_lat"
    t.integer "ending_lng"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lists", force: :cascade do |t|
    t.string "item"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "event_id", null: false
    t.index ["event_id"], name: "index_lists_on_event_id"
  end

  create_table "memories", force: :cascade do |t|
    t.string "pictures"
    t.string "comments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "events", "hikes"
  add_foreign_key "events", "users", column: "users_id"
  add_foreign_key "events_users", "chatrooms"
  add_foreign_key "events_users", "events"
  add_foreign_key "events_users", "memories"
  add_foreign_key "events_users", "users", column: "users_id"
  add_foreign_key "lists", "events"
end
