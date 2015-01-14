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

ActiveRecord::Schema.define(version: 20150114232640) do

  create_table "apartments", force: true do |t|
    t.string   "apartment_number"
    t.integer  "number_of_tenants"
    t.string   "apartment_code"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "building_id"
    t.integer  "landlord_id"
  end

  create_table "buildings", force: true do |t|
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.integer  "zipcode"
    t.integer  "number_of_apartments"
    t.string   "building_code"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "landlord_id"
    t.integer  "detail_id"
  end

  create_table "connections", force: true do |t|
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer  "apartment_id"
    t.integer  "landlord_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "details", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "body"
    t.integer  "building_id"
  end

  create_table "landlords", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone_number"
    t.string   "landlord_code"
    t.datetime "created_at"
    t.datetime "updated_at"
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
  end

  add_index "landlords", ["email"], name: "index_landlords_on_email", unique: true
  add_index "landlords", ["reset_password_token"], name: "index_landlords_on_reset_password_token", unique: true

  create_table "notices", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.boolean  "received"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "notice_type"
    t.integer  "apartment_id"
    t.integer  "tenant_id"
    t.integer  "landlord_id"
  end

  create_table "tenants", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone_number"
    t.datetime "created_at"
    t.datetime "updated_at"
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
    t.integer  "landlord_id"
    t.integer  "building_id"
    t.integer  "apartment_id"
    t.integer  "connection_id"
  end

  add_index "tenants", ["email"], name: "index_tenants_on_email", unique: true
  add_index "tenants", ["reset_password_token"], name: "index_tenants_on_reset_password_token", unique: true

end
