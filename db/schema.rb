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

ActiveRecord::Schema.define(version: 2020_10_09_032318) do

  create_table "account_o_auths", force: :cascade do |t|
    t.integer "account_id"
    t.string "provider"
    t.string "uid"
    t.string "email"
    t.string "access_token"
    t.string "avatar"
    t.text "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["access_token"], name: "index_account_o_auths_on_access_token"
    t.index ["account_id"], name: "index_account_o_auths_on_account_id"
    t.index ["email"], name: "index_account_o_auths_on_email"
    t.index ["provider"], name: "index_account_o_auths_on_provider"
    t.index ["uid"], name: "index_account_o_auths_on_uid"
  end

  create_table "accounts", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "cus_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_accounts_on_confirmation_token", unique: true
    t.index ["email"], name: "index_accounts_on_email", unique: true
    t.index ["reset_password_token"], name: "index_accounts_on_reset_password_token", unique: true
  end

  create_table "accounts_plans", force: :cascade do |t|
    t.integer "account_id"
    t.integer "plan_id"
    t.datetime "start_at"
    t.datetime "end_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_accounts_plans_on_account_id"
    t.index ["plan_id"], name: "index_accounts_plans_on_plan_id"
  end

  create_table "blogs", force: :cascade do |t|
    t.integer "organization_id"
    t.boolean "enable", default: true, null: false
    t.string "title"
    t.text "body"
    t.datetime "publish_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id", "enable", "publish_at"], name: "index_blogs_on_organization_id_and_enable_and_publish_at"
    t.index ["organization_id"], name: "index_blogs_on_organization_id"
  end

  create_table "dartslive_cards", force: :cascade do |t|
    t.integer "account_id"
    t.string "no", null: false
    t.string "name"
    t.string "password"
    t.text "stats"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_dartslive_cards_on_account_id"
    t.index ["no"], name: "index_dartslive_cards_on_no"
  end

  create_table "employment_contracts", force: :cascade do |t|
    t.integer "organization_id"
    t.integer "staff_id"
    t.integer "workplace_id"
    t.integer "employment_type"
    t.date "effective_on"
    t.date "expiration_on"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employment_type"], name: "index_employment_contracts_on_employment_type"
    t.index ["organization_id"], name: "index_employment_contracts_on_organization_id"
    t.index ["staff_id"], name: "index_employment_contracts_on_staff_id"
    t.index ["workplace_id"], name: "index_employment_contracts_on_workplace_id"
  end

  create_table "entries", force: :cascade do |t|
    t.integer "account_id"
    t.integer "recruit_id"
    t.integer "status"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id", "recruit_id", "status"], name: "index_entries_on_account_id_and_recruit_id_and_status"
    t.index ["account_id", "status"], name: "index_entries_on_account_id_and_status"
    t.index ["account_id"], name: "index_entries_on_account_id"
    t.index ["recruit_id", "status"], name: "index_entries_on_recruit_id_and_status"
    t.index ["recruit_id"], name: "index_entries_on_recruit_id"
    t.index ["status"], name: "index_entries_on_status"
  end

  create_table "feedbacks", force: :cascade do |t|
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "menus", force: :cascade do |t|
    t.boolean "enable", default: false, null: false
    t.integer "menu_category_id"
    t.string "name"
    t.text "content"
    t.text "memo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["enable", "menu_category_id"], name: "index_menus_on_enable_and_menu_category_id"
    t.index ["menu_category_id"], name: "index_menus_on_menu_category_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.bigint "corporate_number", null: false
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["corporate_number"], name: "index_organizations_on_corporate_number"
  end

  create_table "organizations_accounts", force: :cascade do |t|
    t.integer "organization_id"
    t.integer "account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_organizations_accounts_on_account_id"
    t.index ["organization_id"], name: "index_organizations_accounts_on_organization_id"
  end

  create_table "parties", force: :cascade do |t|
    t.integer "store_id"
    t.boolean "enable", default: false, null: false
    t.string "name"
    t.integer "position"
    t.text "lead"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["store_id"], name: "index_parties_on_store_id"
  end

  create_table "plans", force: :cascade do |t|
    t.boolean "subscription"
    t.string "title"
    t.integer "amount"
    t.string "currency"
    t.string "interval"
    t.integer "trial_days", default: 0
    t.datetime "start_at"
    t.datetime "end_at"
    t.integer "position"
    t.text "detail"
    t.string "ser_id"
    t.string "image_src"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.bigint "profileable_id"
    t.string "profileable_type"
    t.string "firstname"
    t.string "lastname"
    t.string "nickname"
    t.integer "gender", limit: 1, default: 0
    t.integer "blood", limit: 1, default: 0
    t.date "birthday"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profileable_type", "profileable_id"], name: "index_profiles_on_profileable_type_and_profileable_id"
  end

  create_table "recruits", force: :cascade do |t|
    t.boolean "enable"
    t.string "title"
    t.text "job_content"
    t.text "qualification"
    t.text "compensation"
    t.string "working_place"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["enable", "position"], name: "index_recruits_on_enable_and_position"
  end

  create_table "staffs", force: :cascade do |t|
    t.string "code"
    t.string "first_name"
    t.string "last_name"
    t.string "first_kana"
    t.string "last_kana"
    t.string "nickname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stamped_dailies", force: :cascade do |t|
    t.integer "staff_id"
    t.integer "status"
    t.datetime "work_start_at"
    t.datetime "work_end_at"
    t.datetime "rest_start_at"
    t.datetime "rest_end_at"
    t.integer "ymd"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["staff_id", "ymd"], name: "index_stamped_dailies_on_staff_id_and_ymd", unique: true
    t.index ["staff_id"], name: "index_stamped_dailies_on_staff_id"
    t.index ["status"], name: "index_stamped_dailies_on_status"
    t.index ["ymd"], name: "index_stamped_dailies_on_ymd"
  end

  create_table "stamped_eaches", force: :cascade do |t|
    t.integer "stamped_daily_id"
    t.integer "staff_id"
    t.integer "workplace_id"
    t.integer "stamped_type_id"
    t.datetime "stamped_at"
    t.integer "ymd"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["staff_id"], name: "index_stamped_eaches_on_staff_id"
    t.index ["stamped_daily_id"], name: "index_stamped_eaches_on_stamped_daily_id"
    t.index ["workplace_id"], name: "index_stamped_eaches_on_workplace_id"
    t.index ["ymd"], name: "index_stamped_eaches_on_ymd"
  end

  create_table "stores", force: :cascade do |t|
    t.integer "organization_id"
    t.boolean "enable", default: false, null: false
    t.string "pkey", null: false
    t.string "name"
    t.integer "postcode"
    t.string "region"
    t.string "locality"
    t.string "address"
    t.string "building"
    t.string "tel"
    t.string "fax"
    t.string "opening_time"
    t.string "closing_time"
    t.string "regular_holiday"
    t.date "opened_on"
    t.date "closed_on"
    t.text "spec"
    t.text "near_station"
    t.string "gmap_query"
    t.string "latitude"
    t.string "longitude"
    t.string "facebook_uid"
    t.string "twitter_uid"
    t.string "instagram_uid"
    t.integer "position", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_stores_on_organization_id"
    t.index ["pkey", "enable"], name: "index_stores_on_pkey_and_enable"
    t.index ["position", "enable"], name: "index_stores_on_position_and_enable"
  end

  create_table "stores_menus", force: :cascade do |t|
    t.integer "menu_id"
    t.integer "store_id"
    t.integer "amount", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["menu_id"], name: "index_stores_menus_on_menu_id"
    t.index ["store_id"], name: "index_stores_menus_on_store_id"
  end

  create_table "subscribers", force: :cascade do |t|
    t.string "type"
    t.string "registration_key"
    t.integer "account_id"
    t.boolean "active", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_subscribers_on_account_id"
    t.index ["active", "type"], name: "index_subscribers_on_active_and_type"
    t.index ["registration_key", "type"], name: "index_subscribers_on_registration_key_and_type", unique: true
    t.index ["type"], name: "index_subscribers_on_type"
  end

  create_table "subscription_logs", force: :cascade do |t|
    t.integer "subscription_id"
    t.text "response"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subscription_id"], name: "index_subscription_logs_on_subscription_id"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.integer "account_id"
    t.integer "plan_id"
    t.string "sub_id"
    t.string "token"
    t.integer "status"
    t.datetime "period_start"
    t.datetime "period_end"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_subscriptions_on_account_id"
    t.index ["plan_id"], name: "index_subscriptions_on_plan_id"
  end

  create_table "topics", force: :cascade do |t|
    t.boolean "enable"
    t.bigint "topicable_id"
    t.string "topicable_type"
    t.string "title"
    t.text "body"
    t.datetime "publish_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["topicable_type", "topicable_id", "enable", "publish_at"], name: "ttep_idx"
  end

  create_table "workplaces", force: :cascade do |t|
    t.integer "organization_id"
    t.boolean "enable", null: false
    t.string "name"
    t.integer "postcode"
    t.string "region"
    t.string "locality"
    t.string "address"
    t.string "building"
    t.integer "tel"
    t.integer "fax"
    t.string "gmap_query"
    t.string "latitude"
    t.string "longitude"
    t.integer "date_change_hour"
    t.string "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_workplaces_on_organization_id"
    t.index ["position"], name: "index_workplaces_on_position"
  end

end
