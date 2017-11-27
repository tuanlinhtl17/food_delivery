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

ActiveRecord::Schema.define(version: 20171129134048) do

  create_table "carts", force: :cascade do |t|
    t.integer "users_id"
    t.integer "total_money"
    t.integer "food_id"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["food_id"], name: "index_carts_on_food_id"
    t.index ["users_id"], name: "index_carts_on_users_id"
  end

  create_table "comment_employees", force: :cascade do |t|
    t.integer "user_id"
    t.integer "employee_id"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_comment_employees_on_employee_id"
    t.index ["user_id"], name: "index_comment_employees_on_user_id"
  end

  create_table "comment_foods", force: :cascade do |t|
    t.integer "user_id"
    t.integer "food_id"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["food_id"], name: "index_comment_foods_on_food_id"
    t.index ["user_id"], name: "index_comment_foods_on_user_id"
  end

  create_table "employees", force: :cascade do |t|
    t.integer "employee_type"
    t.string "name"
    t.string "username"
    t.string "phone_number"
    t.string "password_digest"
    t.float "rating_avg"
    t.integer "rate_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "food_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "foods", force: :cascade do |t|
    t.string "name"
    t.float "price"
    t.integer "food_category_id"
    t.float "rating_avg"
    t.integer "rate_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["food_category_id"], name: "index_foods_on_food_category_id"
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "name"
    t.integer "food_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["food_id"], name: "index_ingredients_on_food_id"
  end

  create_table "like_foods", force: :cascade do |t|
    t.integer "user_id"
    t.integer "food_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["food_id"], name: "index_like_foods_on_food_id"
    t.index ["user_id"], name: "index_like_foods_on_user_id"
  end

  create_table "order_details", force: :cascade do |t|
    t.integer "quantity"
    t.integer "order_id"
    t.integer "food_id"
    t.float "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["food_id"], name: "index_order_details_on_food_id"
    t.index ["order_id"], name: "index_order_details_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "user_id"
    t.integer "employee_id"
    t.string "address"
    t.float "total_money"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_orders_on_employee_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.boolean "admin", default: false
    t.string "username"
    t.string "password_digest"
    t.string "address"
    t.string "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
