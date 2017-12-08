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

ActiveRecord::Schema.define(version: 20171208012715) do

  create_table "days", force: :cascade do |t|
    t.integer  "seq",        null: false
    t.string   "alias"
    t.integer  "trip_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trip_id"], name: "index_days_on_trip_id"
  end

  create_table "photos", force: :cascade do |t|
    t.integer  "spot_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "url"
    t.index ["spot_id"], name: "index_photos_on_spot_id"
  end

  create_table "spots", force: :cascade do |t|
    t.integer  "subseq",                   null: false
    t.string   "name",        default: "", null: false
    t.string   "destination", default: "", null: false
    t.text     "memo"
    t.datetime "start"
    t.datetime "end"
    t.integer  "day_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "thumb"
    t.index ["day_id"], name: "index_spots_on_day_id"
  end

  create_table "trips", force: :cascade do |t|
    t.string   "title",       default: "", null: false
    t.text     "description"
    t.string   "region"
    t.datetime "start",                    null: false
    t.datetime "end",                      null: false
    t.integer  "user_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "thumb"
    t.index ["user_id"], name: "index_trips_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email",           default: "", null: false
    t.string   "password_digest", default: "", null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

end
