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

ActiveRecord::Schema.define(version: 20170829080525) do

  create_table "cash_turnovers", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "state",       limit: 255
    t.integer  "priority",    limit: 4
    t.text     "description", limit: 65535
    t.boolean  "paid"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "price",                     precision: 10
  end

  create_table "cash_turnovers_kinds", id: false, force: :cascade do |t|
    t.integer "cash_turnover_id", limit: 4
    t.integer "kind_id",          limit: 4
  end

  add_index "cash_turnovers_kinds", ["cash_turnover_id"], name: "index_cash_turnovers_kinds_on_cash_turnover_id", using: :btree
  add_index "cash_turnovers_kinds", ["kind_id"], name: "index_cash_turnovers_kinds_on_kind_id", using: :btree

  create_table "colors", force: :cascade do |t|
    t.string "name", limit: 255
    t.string "code", limit: 255
  end

  create_table "future_dreams", force: :cascade do |t|
    t.string  "name",        limit: 255
    t.text    "description", limit: 65535
    t.integer "unicorn_id",  limit: 4
  end

  create_table "kinds", force: :cascade do |t|
    t.string  "name",               limit: 255
    t.decimal "price",                          precision: 10
    t.decimal "percent",                        precision: 10
    t.decimal "calculated_price",               precision: 10
    t.string  "cash_turnover_type", limit: 255
  end

  create_table "kinships", force: :cascade do |t|
    t.string  "name",        limit: 255
    t.text    "description", limit: 65535
    t.boolean "colorful"
    t.integer "color_id",    limit: 4
  end

  create_table "pets", force: :cascade do |t|
    t.string  "name",           limit: 255
    t.string  "eye_color",      limit: 255
    t.string  "favourite_food", limit: 255
    t.integer "unicorn_id",     limit: 4
  end

  create_table "schools", force: :cascade do |t|
    t.string "name",     limit: 255
    t.string "location", limit: 255
  end

  create_table "subjects", force: :cascade do |t|
    t.integer "school_id",  limit: 4
    t.integer "unicorn_id", limit: 4
    t.string  "name",       limit: 255
    t.integer "room",       limit: 4
  end

  create_table "unicorns", force: :cascade do |t|
    t.string  "first_name",  limit: 255
    t.integer "age",         limit: 4
    t.float   "horn_length", limit: 24
    t.float   "height",      limit: 24
    t.float   "weight",      limit: 24
    t.integer "kinship_id",  limit: 4
    t.integer "school_id",   limit: 4
    t.integer "pet_id",      limit: 4
  end

  create_table "users", force: :cascade do |t|
    t.string  "name",        limit: 255
    t.string  "email",       limit: 255
    t.string  "password",    limit: 255
    t.integer "age",         limit: 4
    t.string  "description", limit: 255
  end

end
