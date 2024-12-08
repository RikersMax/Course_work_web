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

ActiveRecord::Schema[7.1].define(version: 2024_12_07_100032) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "service_categories", force: :cascade do |t|
    t.bigint "service_id", null: false
    t.bigint "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_service_categories_on_category_id"
    t.index ["service_id", "category_id"], name: "index_service_categories_on_service_id_and_category_id", unique: true
    t.index ["service_id"], name: "index_service_categories_on_service_id"
  end

  create_table "service_stars", force: :cascade do |t|
    t.bigint "service_category_id", null: false
    t.integer "star_1", default: 0
    t.integer "star_2", default: 0
    t.integer "star_3", default: 0
    t.integer "star_4", default: 0
    t.integer "star_5", default: 0
    t.integer "avg_score"
    t.integer "count_stars"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["service_category_id"], name: "add_my_constraint_unique_user_id", unique: true
    t.index ["service_category_id"], name: "index_service_stars_on_service_category_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "url_img"
    t.text "url_addres"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_stars", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "service_category_id", null: false
    t.integer "star"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["service_category_id"], name: "index_user_stars_on_service_category_id"
    t.index ["user_id", "service_category_id"], name: "index_user_stars_on_user_id_and_service_category_id", unique: true
    t.index ["user_id"], name: "index_user_stars_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "service_categories", "categories"
  add_foreign_key "service_categories", "services"
  add_foreign_key "service_stars", "service_categories"
  add_foreign_key "user_stars", "service_categories"
  add_foreign_key "user_stars", "users"
end
