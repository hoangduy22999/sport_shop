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

ActiveRecord::Schema[7.0].define(version: 2022_07_07_190925) do
  create_table "cart_items", force: :cascade do |t|
    t.integer "shopping_session_id", null: false
    t.integer "product_id", null: false
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_cart_items_on_product_id"
    t.index ["shopping_session_id"], name: "index_cart_items_on_shopping_session_id"
  end

  create_table "discounts", force: :cascade do |t|
    t.string "name"
    t.text "desc"
    t.decimal "percent"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "code"
  end

  create_table "order_items", force: :cascade do |t|
    t.integer "order_id", null: false
    t.integer "product_id", null: false
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_order_items_on_order_id"
    t.index ["product_id"], name: "index_order_items_on_product_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "user_id", null: false
    t.decimal "total", default: "0.0"
    t.integer "payment_detail_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["payment_detail_id"], name: "index_orders_on_payment_detail_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "payment_details", force: :cascade do |t|
    t.integer "amount"
    t.string "provider"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_categories", force: :cascade do |t|
    t.string "name"
    t.text "desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_inventories", force: :cascade do |t|
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.text "desc"
    t.string "SKU"
    t.integer "product_category_id", null: false
    t.integer "product_inventory_id", null: false
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "discount_id"
    t.index ["discount_id"], name: "index_products_on_discount_id"
    t.index ["product_category_id"], name: "index_products_on_product_category_id"
    t.index ["product_inventory_id"], name: "index_products_on_product_inventory_id"
  end

  create_table "shopping_sessions", force: :cascade do |t|
    t.integer "user_id", null: false
    t.decimal "total", default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_shopping_sessions_on_user_id"
  end

  create_table "user_addresses", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "address_line1"
    t.string "address_line2"
    t.string "city"
    t.string "postal_code"
    t.string "country"
    t.integer "telephone"
    t.string "mobile"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_addresses_on_user_id"
  end

  create_table "user_payments", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "payment_type"
    t.string "provider"
    t.integer "account_no"
    t.datetime "expiry"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_payments_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "username"
    t.string "first_name"
    t.string "last_name"
    t.integer "telephone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "cart_items", "products"
  add_foreign_key "cart_items", "shopping_sessions"
  add_foreign_key "order_items", "orders"
  add_foreign_key "order_items", "products"
  add_foreign_key "orders", "payment_details"
  add_foreign_key "orders", "users"
  add_foreign_key "products", "discounts"
  add_foreign_key "products", "product_categories"
  add_foreign_key "products", "product_inventories"
  add_foreign_key "shopping_sessions", "users"
  add_foreign_key "user_addresses", "users"
  add_foreign_key "user_payments", "users"
end
