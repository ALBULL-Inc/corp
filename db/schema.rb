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

ActiveRecord::Schema.define(version: 20180221123821) do

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

  create_table "backgrounds", force: :cascade do |t|
    t.integer  "profile_id"
    t.integer  "background_type"
    t.date     "joined_on"
    t.date     "left_on"
    t.string   "site"
    t.string   "department"
    t.text     "outline"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["background_type"], name: "index_backgrounds_on_background_type"
    t.index ["joined_on"], name: "index_backgrounds_on_joined_on"
    t.index ["profile_id", "background_type", "joined_on"], name: "idx_backgrounds_compo_001"
    t.index ["profile_id"], name: "index_backgrounds_on_profile_id"
  end

  create_table "blogs", force: :cascade do |t|
    t.boolean  "enable",     default: true, null: false
    t.string   "title"
    t.text     "body"
    t.datetime "publish_at"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "children", force: :cascade do |t|
    t.integer  "family_id"
    t.integer  "place_id"
    t.string   "first_name"
    t.string   "first_name_kana"
    t.string   "nickname"
    t.date     "birthday"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["family_id"], name: "index_children_on_family_id"
    t.index ["place_id"], name: "index_children_on_place_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.integer  "profile_id"
    t.integer  "contact_type"
    t.string   "content"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["contact_type"], name: "index_contacts_on_contact_type"
    t.index ["profile_id", "contact_type"], name: "index_contacts_on_profile_id_and_contact_type"
    t.index ["profile_id"], name: "index_contacts_on_profile_id"
  end

  create_table "entries", force: :cascade do |t|
    t.integer  "account_id"
    t.integer  "recruit_id"
    t.integer  "status"
    t.text     "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id", "recruit_id", "status"], name: "index_entries_on_account_id_and_recruit_id_and_status"
    t.index ["account_id", "status"], name: "index_entries_on_account_id_and_status"
    t.index ["account_id"], name: "index_entries_on_account_id"
    t.index ["recruit_id", "status"], name: "index_entries_on_recruit_id_and_status"
    t.index ["recruit_id"], name: "index_entries_on_recruit_id"
    t.index ["status"], name: "index_entries_on_status"
  end

  create_table "families", force: :cascade do |t|
    t.string   "title"
    t.string   "title_kana"
    t.string   "encrypted_code"
    t.string   "md5_code"
    t.string   "remember_token"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "months", force: :cascade do |t|
    t.string   "ym",                         null: false
    t.boolean  "fixed",      default: false, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "months_photos", force: :cascade do |t|
    t.integer  "month_id"
    t.integer  "photo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["month_id"], name: "index_months_photos_on_month_id"
    t.index ["photo_id"], name: "index_months_photos_on_photo_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.string   "name"
    t.text     "address"
    t.string   "tel"
    t.string   "fax"
    t.text     "memo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "photos", force: :cascade do |t|
    t.string   "image_uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "places", force: :cascade do |t|
    t.integer  "organization_id"
    t.string   "name"
    t.string   "key"
    t.text     "address"
    t.string   "tel"
    t.string   "fax"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.string   "captain_name"
    t.string   "captain_message_title"
    t.text     "captain_message"
    t.string   "captain_thumbnail_uid"
    t.text     "message"
    t.boolean  "enable",                default: false, null: false
    t.integer  "position",              default: 99999, null: false
    t.string   "let"
    t.string   "lng"
    t.string   "gmap_url"
    t.index ["key"], name: "index_places_on_key"
    t.index ["organization_id"], name: "index_places_on_organization_id"
  end

  create_table "places_photos", force: :cascade do |t|
    t.integer  "place_id"
    t.integer  "photo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["photo_id"], name: "index_places_photos_on_photo_id"
    t.index ["place_id"], name: "index_places_photos_on_place_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.string   "image_uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  create_table "qualifications", force: :cascade do |t|
    t.integer  "profile_id"
    t.date     "issued_on"
    t.string   "title"
    t.text     "outline"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["issued_on"], name: "index_qualifications_on_issued_on"
    t.index ["profile_id", "issued_on"], name: "index_qualifications_on_profile_id_and_issued_on"
    t.index ["profile_id"], name: "index_qualifications_on_profile_id"
  end

  create_table "recruits", force: :cascade do |t|
    t.boolean  "enable"
    t.string   "title"
    t.text     "job_content"
    t.text     "qualification"
    t.text     "compensation"
    t.string   "working_place"
    t.integer  "position"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "portrait_uid"
    t.integer  "employment_type"
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

  create_table "usage_records", force: :cascade do |t|
    t.integer  "month_id"
    t.integer  "child_id"
    t.integer  "place_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["child_id"], name: "index_usage_records_on_child_id"
    t.index ["month_id"], name: "index_usage_records_on_month_id"
    t.index ["place_id"], name: "index_usage_records_on_place_id"
  end

end
