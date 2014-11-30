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

ActiveRecord::Schema.define(version: 20141128075259) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "image"
  end

  create_table "order_details", force: true do |t|
    t.integer "amount"
    t.decimal "price"
    t.integer "order_id"
    t.integer "product_id"
  end

  create_table "orders", force: true do |t|
    t.integer  "bartender_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state",        default: "opened"
    t.decimal  "total_price"
  end

  create_table "products", force: true do |t|
    t.string   "product_type"
    t.string   "name"
    t.string   "size"
    t.decimal  "price"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
    t.string   "category"
  end

  create_table "users", force: true do |t|
    t.string   "username",                                      null: false
    t.string   "email",                                         null: false
    t.string   "crypted_password",                              null: false
    t.string   "salt",                                          null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "activation_state"
    t.string   "activation_token"
    t.datetime "activation_token_expires_at"
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.string   "uid"
    t.string   "provider"
    t.boolean  "friendly_token",               default: false
    t.string   "avatar"
    t.string   "role",                         default: "User"
  end

  add_index "users", ["activation_token"], name: "index_users_on_activation_token", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["remember_me_token"], name: "index_users_on_remember_me_token", using: :btree

end
