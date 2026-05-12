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

ActiveRecord::Schema[8.1].define(version: 2026_05_12_221224) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "categories", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "icon"
    t.string "name"
    t.string "slug"
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_categories_on_slug", unique: true
  end

  create_table "destinations", force: :cascade do |t|
    t.string "best_season"
    t.string "country"
    t.string "cover_image"
    t.datetime "created_at", null: false
    t.string "currency"
    t.text "description"
    t.string "language"
    t.string "name"
    t.string "price_range"
    t.float "rating"
    t.string "timezone"
    t.datetime "updated_at", null: false
  end

  create_table "favorites", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "destination_id", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["destination_id"], name: "index_favorites_on_destination_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "flights", force: :cascade do |t|
    t.string "airline"
    t.datetime "arrival_time"
    t.datetime "created_at", null: false
    t.datetime "departure_time"
    t.string "destination"
    t.integer "duration"
    t.string "origin"
    t.float "price"
    t.integer "stops"
    t.datetime "updated_at", null: false
  end

  create_table "hotels", force: :cascade do |t|
    t.text "amenities"
    t.datetime "created_at", null: false
    t.bigint "destination_id", null: false
    t.text "images"
    t.string "name"
    t.float "price_per_night"
    t.float "rating"
    t.integer "stars"
    t.datetime "updated_at", null: false
    t.index ["destination_id"], name: "index_hotels_on_destination_id"
  end

  create_table "itineraries", force: :cascade do |t|
    t.float "budget"
    t.datetime "created_at", null: false
    t.bigint "destination_id", null: false
    t.date "end_date"
    t.date "start_date"
    t.integer "status"
    t.string "title"
    t.string "travel_style"
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["destination_id"], name: "index_itineraries_on_destination_id"
    t.index ["user_id"], name: "index_itineraries_on_user_id"
  end

  create_table "itinerary_activities", force: :cascade do |t|
    t.boolean "booking_required"
    t.string "category"
    t.float "cost"
    t.datetime "created_at", null: false
    t.text "description"
    t.bigint "itinerary_day_id", null: false
    t.string "time_slot"
    t.string "title"
    t.datetime "updated_at", null: false
    t.index ["itinerary_day_id"], name: "index_itinerary_activities_on_itinerary_day_id"
  end

  create_table "itinerary_days", force: :cascade do |t|
    t.string "accommodation"
    t.datetime "created_at", null: false
    t.date "date"
    t.integer "day_number"
    t.text "description"
    t.bigint "itinerary_id", null: false
    t.datetime "updated_at", null: false
    t.index ["itinerary_id"], name: "index_itinerary_days_on_itinerary_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "cons"
    t.text "content"
    t.datetime "created_at", null: false
    t.bigint "destination_id", null: false
    t.text "pros"
    t.integer "rating"
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.date "visit_date"
    t.index ["destination_id"], name: "index_reviews_on_destination_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "subcategories", force: :cascade do |t|
    t.bigint "category_id", null: false
    t.datetime "created_at", null: false
    t.string "name"
    t.string "slug"
    t.datetime "updated_at", null: false
    t.index ["category_id", "slug"], name: "index_subcategories_on_category_id_and_slug", unique: true
    t.index ["category_id"], name: "index_subcategories_on_category_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "avatar"
    t.datetime "created_at", null: false
    t.string "email"
    t.jsonb "preferences"
    t.boolean "pro_subscriber"
    t.integer "travel_level"
    t.datetime "updated_at", null: false
    t.string "username"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "favorites", "destinations"
  add_foreign_key "favorites", "users"
  add_foreign_key "hotels", "destinations"
  add_foreign_key "itineraries", "destinations"
  add_foreign_key "itineraries", "users"
  add_foreign_key "itinerary_activities", "itinerary_days"
  add_foreign_key "itinerary_days", "itineraries"
  add_foreign_key "reviews", "destinations"
  add_foreign_key "reviews", "users"
  add_foreign_key "subcategories", "categories"
end
