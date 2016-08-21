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

ActiveRecord::Schema.define(version: 20160820215336) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "babysitters", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "age"
    t.string   "location"
    t.string   "bio"
    t.string   "skills"
    t.index ["user_id"], name: "index_babysitters_on_user_id", using: :btree
  end

  create_table "booking_requests", force: :cascade do |t|
    t.integer  "parent_id"
    t.integer  "babysitter_id"
    t.integer  "duration"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "desired_time"
    t.string   "desired_date"
    t.index ["babysitter_id"], name: "index_booking_requests_on_babysitter_id", using: :btree
    t.index ["parent_id"], name: "index_booking_requests_on_parent_id", using: :btree
  end

  create_table "bookings", force: :cascade do |t|
    t.integer  "parent_id"
    t.integer  "babysitter_id"
    t.integer  "duration"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "desired_date"
    t.string   "desired_time"
    t.index ["babysitter_id"], name: "index_bookings_on_babysitter_id", using: :btree
    t.index ["parent_id"], name: "index_bookings_on_parent_id", using: :btree
  end

  create_table "parent_babysitters", force: :cascade do |t|
    t.integer  "parent_id"
    t.integer  "babysitter_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "parents", force: :cascade do |t|
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "address"
    t.integer  "kid_count"
    t.integer  "user_id"
    t.string   "specific_needs"
    t.string   "extra_requests"
    t.index ["user_id"], name: "index_parents_on_user_id", using: :btree
  end

  create_table "requests", force: :cascade do |t|
    t.integer  "parent_id"
    t.integer  "babysitter_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "parent_babysitter_id"
    t.string  "title"
    t.string  "description"
    t.integer "rating"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",        limit: 30
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["username"], name: "index_users_on_username", unique: true, using: :btree
  end

  add_foreign_key "babysitters", "users"
  add_foreign_key "booking_requests", "babysitters"
  add_foreign_key "booking_requests", "parents"
  add_foreign_key "bookings", "babysitters"
  add_foreign_key "bookings", "parents"
  add_foreign_key "parents", "users"
end
