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

ActiveRecord::Schema.define(version: 20160710075017) do

  create_table "address_backups", force: :cascade do |t|
    t.integer  "user_id",     limit: 4
    t.string   "province",    limit: 255
    t.string   "city",        limit: 255
    t.string   "country",     limit: 255
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "consignee",   limit: 255, null: false
    t.string   "phonenumber", limit: 255, null: false
  end

  create_table "addresses", force: :cascade do |t|
    t.integer  "user_id",     limit: 4
    t.string   "province",    limit: 255
    t.string   "city",        limit: 255
    t.string   "country",     limit: 255
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "consignee",   limit: 255, null: false
    t.string   "phonenumber", limit: 255, null: false
  end

  create_table "carts", force: :cascade do |t|
    t.integer  "product_id", limit: 4
    t.integer  "user_id",    limit: 4
    t.integer  "number",     limit: 4, default: 1
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "product_id", limit: 4
    t.integer  "address_id", limit: 4
    t.integer  "price",      limit: 4
    t.integer  "number",     limit: 4
    t.integer  "counts",     limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "product_name", limit: 255
    t.integer  "price",        limit: 4
    t.string   "description",  limit: 255
    t.integer  "inventory",    limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",         limit: 255
    t.string   "salt",             limit: 255
    t.string   "crypted_password", limit: 255
    t.string   "email",            limit: 255
    t.string   "active_code",      limit: 255
    t.boolean  "is_active",                    default: false
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.boolean  "is_admin",                     default: false, null: false
    t.string   "default_addr",     limit: 255,                 null: false
  end

end
