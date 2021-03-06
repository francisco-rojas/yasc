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

ActiveRecord::Schema.define(version: 20150616025130) do

  create_table "buildings", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "address",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "chair_products", force: :cascade do |t|
    t.integer  "chair_id",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "chairs", force: :cascade do |t|
    t.string   "name",                       null: false
    t.string   "model",       default: "",   null: false
    t.text     "description", default: "",   null: false
    t.decimal  "nrc",                        null: false
    t.boolean  "active",      default: true, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "cubicle_products", force: :cascade do |t|
    t.integer  "cubicle_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cubicles", force: :cascade do |t|
    t.string   "name",                           null: false
    t.integer  "height",          default: 0,    null: false
    t.integer  "area",            default: 0,    null: false
    t.text     "description",     default: "",   null: false
    t.integer  "unit_of_measure", default: 0,    null: false
    t.integer  "purchase_type",   default: 0,    null: false
    t.decimal  "nrc",             default: 0.0,  null: false
    t.decimal  "mrc",             default: 0.0,  null: false
    t.boolean  "active",          default: true, null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "floors", force: :cascade do |t|
    t.string   "name",        null: false
    t.integer  "number",      null: false
    t.integer  "building_id", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "floors", ["number", "building_id"], name: "index_floors_on_number_and_building_id", unique: true

  create_table "items", force: :cascade do |t|
    t.integer  "order_id",                                            null: false
    t.integer  "building_id"
    t.integer  "floor_id"
    t.string   "room",                                                null: false
    t.integer  "quantity"
    t.decimal  "cost_per_item", precision: 8, scale: 2, default: 0.0, null: false
    t.decimal  "total_amount",  precision: 8, scale: 2, default: 0.0, null: false
    t.integer  "product_id",                                          null: false
    t.string   "product_type",                                        null: false
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id",                                            null: false
    t.integer  "building_id"
    t.integer  "status",                                             null: false
    t.string   "number"
    t.decimal  "total_amount", precision: 8, scale: 2, default: 0.0, null: false
    t.integer  "items_count",                          default: 0,   null: false
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
  end

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
