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

ActiveRecord::Schema.define(version: 2020_07_07_055938) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "gifts", force: :cascade do |t|
    t.string "gift_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gifts_orders", force: :cascade do |t|
    t.bigint "gift_id"
    t.bigint "order_id"
    t.index ["gift_id"], name: "index_gifts_orders_on_gift_id"
    t.index ["order_id"], name: "index_gifts_orders_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "status"
    t.bigint "school_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["school_id"], name: "index_orders_on_school_id"
  end

  create_table "orders_recipients", force: :cascade do |t|
    t.bigint "order_id"
    t.bigint "recipient_id"
    t.index ["order_id"], name: "index_orders_recipients_on_order_id"
    t.index ["recipient_id"], name: "index_orders_recipients_on_recipient_id"
  end

  create_table "recipients", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.bigint "school_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["school_id"], name: "index_recipients_on_school_id"
  end

  create_table "schools", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "authentication_token"
    t.datetime "deactivated_at"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "orders", "schools"
  add_foreign_key "recipients", "schools"
end
