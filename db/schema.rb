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

ActiveRecord::Schema.define(version: 20170102225519) do

  create_table "account_o_auths", force: :cascade do |t|
    t.integer  "account_id"
    t.string   "provider"
    t.string   "uid"
    t.string   "email"
    t.string   "access_token"
    t.string   "avatar"
    t.text     "data"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["access_token"], name: "index_account_o_auths_on_access_token"
    t.index ["account_id"], name: "index_account_o_auths_on_account_id"
    t.index ["email"], name: "index_account_o_auths_on_email"
    t.index ["provider"], name: "index_account_o_auths_on_provider"
    t.index ["uid"], name: "index_account_o_auths_on_uid"
  end

  create_table "accounts", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["confirmation_token"], name: "index_accounts_on_confirmation_token", unique: true
    t.index ["email"], name: "index_accounts_on_email", unique: true
    t.index ["reset_password_token"], name: "index_accounts_on_reset_password_token", unique: true
  end

  create_table "profiles", force: :cascade do |t|
    t.integer  "account_id"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "nickname"
    t.integer  "gender",     limit: 1, default: 0
    t.integer  "blood",      limit: 1, default: 0
    t.date     "birthday"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.index ["account_id"], name: "index_profiles_on_account_id"
  end

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
    t.index ["enable", "position"], name: "index_recruits_on_enable_and_position"
  end

  create_table "topics", force: :cascade do |t|
    t.boolean  "enable"
    t.string   "title"
    t.text     "body"
    t.datetime "publish_at"
    t.boolean  "carousel"
    t.string   "carousel_img"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["enable", "publish_at", "carousel"], name: "index_topics_on_enable_and_publish_at_and_carousel"
  end

end
