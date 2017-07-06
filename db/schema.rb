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

ActiveRecord::Schema.define(version: 20170706083937) do

  create_table "kinships", force: :cascade do |t|
    t.string "name"
    t.string "color"
    t.text   "description"
  end

  create_table "pets", force: :cascade do |t|
    t.string  "pet_name"
    t.string  "eye_color"
    t.string  "favourite_food"
    t.integer "unicorn_id"
  end

  create_table "schools", force: :cascade do |t|
    t.string "school_name"
    t.string "location"
  end

  create_table "subjects", force: :cascade do |t|
    t.integer "school_id"
    t.integer "unicorn_id"
    t.string  "subject_name"
    t.integer "room"
  end

  create_table "unicorns", force: :cascade do |t|
    t.string  "first_name"
    t.integer "age"
    t.float   "horn_length"
    t.float   "height"
    t.float   "weight"
    t.integer "kinship_id"
    t.integer "school_id"
    t.integer "pet_id"
  end

end
