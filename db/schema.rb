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

ActiveRecord::Schema.define(version: 2021_06_16_110042) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ads", force: :cascade do |t|
    t.string "type"
    t.string "category"
    t.string "title"
    t.text "description"
    t.string "adress"
    t.datetime "date"
    t.string "zip_code"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "formations", force: :cascade do |t|
    t.string "type"
    t.string "title"
    t.text "description"
    t.datetime "start_date"
    t.datetime "end_date"
    t.string "localisation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "inscriptions", force: :cascade do |t|
    t.integer "user_id"
    t.integer "formation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "participations", force: :cascade do |t|
    t.string "status"
    t.integer "user_id"
    t.integer "ad_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "first_name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.string "description", default: "", null: false
    t.string "classification", default: "", null: false
    t.string "phone", default: "", null: false
    t.string "address", default: "", null: false
    t.string "zip_code", default: "", null: false
    t.datetime "date_of_birth"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
