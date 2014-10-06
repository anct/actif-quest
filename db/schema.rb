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

ActiveRecord::Schema.define(version: 20141006142723) do

  create_table "achievements", force: true do |t|
    t.string   "name"
    t.string   "condition"
    t.string   "description"
    t.string   "icon_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "admins", force: true do |t|
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
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true

  create_table "beacons", force: true do |t|
    t.string   "uuid"
    t.integer  "minor"
    t.integer  "major"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "floor"
    t.integer  "bound_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bounds", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "check_ins", force: true do |t|
    t.integer  "user_id"
    t.integer  "bound_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "exhibitions", force: true do |t|
    t.string   "name"
    t.string   "introduction"
    t.string   "image_url"
    t.integer  "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "bound_id"
  end

  create_table "favorites", force: true do |t|
    t.integer  "user_id"
    t.integer  "favorable_id"
    t.string   "favorable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groups", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "identities", force: true do |t|
    t.integer  "user_id"
    t.string   "uid"
    t.string   "provider"
    t.string   "token"
    t.datetime "expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "secret"
    t.datetime "deleted_at"
  end

  add_index "identities", ["uid", "provider"], name: "index_identities_on_uid_and_provider", unique: true
  add_index "identities", ["uid"], name: "index_identities_on_uid"
  add_index "identities", ["user_id", "provider"], name: "index_identities_on_user_id_and_provider", unique: true

  create_table "notifications", force: true do |t|
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spam_reports", force: true do |t|
    t.integer  "reporter_id"
    t.integer  "spam_id"
    t.string   "spam_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "statuses", force: true do |t|
    t.integer  "user_id"
    t.string   "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
  end

  create_table "taken_treasures", force: true do |t|
    t.string   "user_id"
    t.integer  "treasure_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "treasures", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "image_url"
    t.integer  "bound_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "screen_name"
    t.string   "image_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.string   "email"
    t.string   "encrypted_password"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "authentication_token"
    t.string   "remember_token"
  end

  add_index "users", ["authentication_token"], name: "index_users_on_authentication_token"
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["name"], name: "index_users_on_name", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "votes", force: true do |t|
    t.integer  "user_id"
    t.integer  "votable_id"
    t.string   "votable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
