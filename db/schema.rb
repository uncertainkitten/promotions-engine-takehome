# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2024_12_16_065541) do
  create_table "carts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "inventories", force: :cascade do |t|
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_inventories_on_user_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.decimal "price"
    t.decimal "weight"
    t.integer "quantity"
    t.string "brand"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "inventory_id"
    t.integer "cart_id"
    t.integer "category_id"
    t.index ["cart_id"], name: "index_items_on_cart_id"
    t.index ["category_id"], name: "index_items_on_category_id"
    t.index ["inventory_id"], name: "index_items_on_inventory_id"
  end

  create_table "promotions", force: :cascade do |t|
    t.string "name"
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer "category_id"
    t.integer "user_id"
    t.float "amount"
    t.boolean "percent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "buyX"
    t.integer "getY"
    t.float "weightThreshold"
    t.string "type"
    t.index ["category_id"], name: "index_promotions_on_category_id"
    t.index ["user_id"], name: "index_promotions_on_user_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "ip_address"
    t.string "user_agent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email_address", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "business_user"
    t.integer "business_id"
    t.index ["business_id"], name: "index_users_on_business_id"
    t.index ["email_address"], name: "index_users_on_email_address", unique: true
  end

  add_foreign_key "inventories", "users"
  add_foreign_key "items", "carts"
  add_foreign_key "items", "categories"
  add_foreign_key "items", "inventories"
  add_foreign_key "promotions", "categories"
  add_foreign_key "promotions", "users"
  add_foreign_key "sessions", "users"
  add_foreign_key "users", "users", column: "business_id"
end
