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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20161110060128) do
=======
ActiveRecord::Schema.define(version: 20161110055721) do

  create_table "humidity_sensor_readings", force: :cascade do |t|
    t.integer  "measurement"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end
>>>>>>> humidity

  create_table "moisture_sensor_readings", force: :cascade do |t|
    t.integer  "measurement"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "system_settings", force: :cascade do |t|
    t.integer  "singleton_guard"
    t.integer  "moisture_threshold"
    t.float    "temperature_threshold"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "temperature_sensor_readings", force: :cascade do |t|
    t.float    "measurement"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
