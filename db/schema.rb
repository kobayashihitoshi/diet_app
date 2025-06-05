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

ActiveRecord::Schema[7.2].define(version: 2025_06_04_142853) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "exercise_records", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.date "recorded_on"
    t.string "activity"
    t.integer "duration"
    t.integer "calories_burned"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_exercise_records_on_user_id"
  end

  create_table "food_records", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.date "recorded_on"
    t.string "meal_type"
    t.string "menu"
    t.integer "calories"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_food_records_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.decimal "current_weight"
    t.decimal "target_weight"
    t.integer "age"
    t.string "gender"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "advice_cache"
  end

  create_table "weight_records", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.decimal "weight"
    t.date "recorded_on"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_weight_records_on_user_id"
  end

  add_foreign_key "exercise_records", "users"
  add_foreign_key "food_records", "users"
  add_foreign_key "weight_records", "users"
end
