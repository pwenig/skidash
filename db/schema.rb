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

ActiveRecord::Schema.define(version: 20151218221516) do

  create_table "conditions", force: true do |t|
    t.integer  "mountain_id"
    t.integer  "temperature"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "condition"
    t.text     "wind"
    t.text     "forecast_today"
    t.integer  "high_temp"
    t.integer  "low_temp"
    t.integer  "snow_today"
    t.string   "forecast_title_day2"
    t.text     "forecast_day2"
    t.string   "forecast_title_day3"
    t.text     "forecast_day3"
    t.string   "icon"
  end

  create_table "mountains", force: true do |t|
    t.string   "name"
    t.string   "zip_code"
    t.string   "opening_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "lifts_open",   default: "n/a"
    t.string   "runs_open",    default: "n/a"
    t.string   "terrain_url",  default: "n/a"
    t.string   "mtn_image1"
    t.string   "mtn_image2"
    t.string   "mtn_image3"
    t.string   "base"
  end

  create_table "users", force: true do |t|
    t.string "name"
    t.string "phone_number"
  end

end
