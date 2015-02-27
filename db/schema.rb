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

ActiveRecord::Schema.define(version: 20150227222039) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: true do |t|
    t.float    "amount"
    t.float    "rate"
    t.integer  "crew_size"
    t.integer  "morning_crews", default: 1
    t.integer  "evening_crews", default: 0
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.float    "duration"
    t.float    "early_start"
    t.float    "early_finish"
    t.float    "late_start"
    t.float    "late_finish"
    t.float    "free_float"
    t.float    "total_float"
    t.boolean  "is_critical"
  end

  create_table "dependencies", force: true do |t|
    t.integer  "activity_id"
    t.integer  "predecessor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", force: true do |t|
    t.string   "name"
    t.float    "shift_length", default: 10.0
    t.integer  "week_length",  default: 5
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
