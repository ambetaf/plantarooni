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

ActiveRecord::Schema.define(version: 20161206061217) do

  create_table "humidity_sensor_readings", force: :cascade do |t|
    t.float    "measurement"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "moisture_sensor_readings", force: :cascade do |t|
    t.integer  "measurement"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "plants", force: :cascade do |t|
    t.string   "name"
    t.float    "humidity_threshold"
    t.integer  "moisture_threshold"
    t.float    "temperature_threshold"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "system_settings", force: :cascade do |t|
    t.integer  "singleton_guard"
    t.integer  "moisture_threshold"
    t.float    "temperature_threshold"
    t.float    "humidity_threshold"
    t.boolean  "manual_control"
    t.boolean  "sprinkler_manual_on"
    t.boolean  "cooling_manual_on"
    t.boolean  "exhaust_manual_on"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.float    "humidity_threshold"
  end

  create_table "temperature_sensor_readings", force: :cascade do |t|
    t.float    "measurement"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",         null: false
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["username"], name: "index_users_on_username", unique: true
  end

end
