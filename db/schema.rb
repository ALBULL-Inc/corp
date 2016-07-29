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

ActiveRecord::Schema.define(version: 20160625133456) do

  create_table "recruits", force: :cascade do |t|
    t.boolean  "enable"
    t.string   "title"
    t.text     "job_content"
    t.text     "qualification"
    t.text     "compensation"
    t.string   "working_place"
    t.integer  "position"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "recruits", ["enable", "position"], name: "index_recruits_on_enable_and_position"

  create_table "topics", force: :cascade do |t|
    t.boolean  "enable"
    t.string   "title"
    t.text     "body"
    t.datetime "publish_at"
    t.boolean  "carousel"
    t.string   "carousel_img"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "topics", ["enable", "publish_at", "carousel"], name: "index_topics_on_enable_and_publish_at_and_carousel"

end
