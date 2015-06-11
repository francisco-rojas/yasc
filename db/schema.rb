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

ActiveRecord::Schema.define(version: 20150611020808) do

  create_table "books", force: :cascade do |t|
    t.string  "name"
    t.text    "description"
    t.decimal "nrc",         default: 0.0
    t.boolean "active",      default: true
  end

  add_index "books", ["active"], name: "index_books_on_active"
  add_index "books", ["name"], name: "index_books_on_name", unique: true

  create_table "cars", force: :cascade do |t|
    t.string  "name"
    t.text    "description"
    t.decimal "nrc",           default: 0.0
    t.decimal "mrc",           default: 0.0
    t.boolean "active",        default: true
    t.integer "purchase_type"
  end

  add_index "cars", ["active"], name: "index_cars_on_active"
  add_index "cars", ["name"], name: "index_cars_on_name", unique: true
  add_index "cars", ["purchase_type"], name: "index_cars_on_purchase_type"

  create_table "houses", force: :cascade do |t|
    t.string  "name"
    t.text    "description"
    t.decimal "nrc",           default: 0.0
    t.decimal "mrc",           default: 0.0
    t.boolean "active",        default: true
    t.integer "purchase_type"
  end

  add_index "houses", ["active"], name: "index_houses_on_active"
  add_index "houses", ["name"], name: "index_houses_on_name", unique: true
  add_index "houses", ["purchase_type"], name: "index_houses_on_purchase_type"

  create_table "lamps", force: :cascade do |t|
    t.string  "name"
    t.text    "description"
    t.decimal "nrc",         default: 0.0
    t.boolean "active",      default: true
  end

  add_index "lamps", ["active"], name: "index_lamps_on_active"
  add_index "lamps", ["name"], name: "index_lamps_on_name", unique: true

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
