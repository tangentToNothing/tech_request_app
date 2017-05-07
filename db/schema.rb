# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20170504212915) do

  create_table "events", force: :cascade do |t|
    t.string   "email"
    t.string   "name"
    t.string   "phone_number"
    t.string   "department"
    t.string   "payment_method"
    t.integer  "eas_account"
    t.string   "event_type"
    t.string   "event_name"
    t.integer  "reservation_number"
    t.date     "event_date"
    t.time     "start_time"
    t.time     "end_time"
    t.boolean  "multi_day"
    t.integer  "location_id"
    t.integer  "wireless_handheld"
    t.integer  "wireless_lav"
    t.integer  "wired_handheld"
    t.integer  "table_stands"
    t.integer  "floor_stands"
    t.boolean  "web_conferencing"
    t.boolean  "press_feed"
    t.boolean  "third_party"
    t.string   "third_party_name"
    t.boolean  "additional_laptops"
    t.integer  "additional_laptops_count"
    t.string   "comments"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string   "name"
    t.integer  "room_type_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "room_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
