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

ActiveRecord::Schema.define(version: 20171213181943) do

  create_table "gymnasia", force: :cascade do |t|
    t.string   "name"
    t.integer  "maxUsers"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
    t.string   "image"
    t.string   "info_url"
    t.integer  "open_hour"
    t.integer  "close_hour"
  end

  create_table "reservations", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "timeslot_id"
    t.integer  "user_id"
  end

  create_table "timeslots", force: :cascade do |t|
    t.datetime "date"
    t.integer  "reservations_count", default: 0, null: false
    t.integer  "gymnasia_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "hour"
  end

  add_index "timeslots", ["date"], name: "index_timeslots_on_date"
  add_index "timeslots", ["gymnasia_id"], name: "index_timeslots_on_gymnasia_id"

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
    t.integer  "reservations_count",     default: 0,  null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
