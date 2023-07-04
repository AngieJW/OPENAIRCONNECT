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

ActiveRecord::Schema[7.0].define(version: 2023_07_04_143700) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "event_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_bookings_on_event_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "chatrooms", force: :cascade do |t|
    t.string "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "event_id", null: false
    t.index ["event_id"], name: "index_chatrooms_on_event_id"
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
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "memory_id"
    t.string "location"
    t.index ["hike_id"], name: "index_events_on_hike_id"
    t.index ["memory_id"], name: "index_events_on_memory_id"
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "hikes", force: :cascade do |t|
    t.float "distance"
    t.integer "elevation"
    t.time "duration"
    t.float "starting_lat"
    t.float "starting_long"
    t.float "ending_lat"
    t.float "ending_long"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "item_brings", force: :cascade do |t|
    t.bigint "event_id", null: false
    t.bigint "user_id", null: false
    t.bigint "item_id", null: false
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_item_brings_on_event_id"
    t.index ["item_id"], name: "index_item_brings_on_item_id"
    t.index ["user_id"], name: "index_item_brings_on_user_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.integer "quantity"
    t.bigint "event_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "packed"
    t.index ["event_id"], name: "index_items_on_event_id"
  end

  create_table "memories", force: :cascade do |t|
    t.string "picture"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.string "content"
    t.bigint "chatroom_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chatroom_id"], name: "index_messages_on_chatroom_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "phone_number"
    t.integer "zip_code"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bookings", "events"
  add_foreign_key "bookings", "users"
  add_foreign_key "chatrooms", "events"
  add_foreign_key "events", "hikes"
  add_foreign_key "events", "memories"
  add_foreign_key "events", "users"
  add_foreign_key "item_brings", "events"
  add_foreign_key "item_brings", "items"
  add_foreign_key "item_brings", "users"
  add_foreign_key "items", "events"
  add_foreign_key "messages", "chatrooms"
  add_foreign_key "messages", "users"
end
