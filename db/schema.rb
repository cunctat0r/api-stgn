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

ActiveRecord::Schema.define(version: 2018_05_07_104115) do

  create_table "measurements", force: :cascade do |t|
    t.decimal "F0"
    t.decimal "T0"
    t.decimal "F1"
    t.decimal "T1"
    t.decimal "F2"
    t.decimal "T2"
    t.decimal "F3"
    t.decimal "T3"
    t.decimal "F4"
    t.decimal "T4"
    t.decimal "F5"
    t.decimal "T5"
    t.decimal "F6"
    t.decimal "T6"
    t.decimal "F7"
    t.decimal "T7"
    t.decimal "F8"
    t.decimal "T8"
    t.decimal "F9"
    t.decimal "T9"
    t.decimal "F10"
    t.decimal "T10"
    t.decimal "F11"
    t.decimal "T11"
    t.decimal "F12"
    t.decimal "T12"
    t.decimal "F13"
    t.decimal "T13"
    t.decimal "F14"
    t.decimal "T14"
    t.decimal "Upit"
    t.decimal "wind_direction"
    t.decimal "wind_speed"
    t.integer "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_measurements_on_post_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "main_phone_number"
    t.string "line_name"
    t.string "num_tower"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
