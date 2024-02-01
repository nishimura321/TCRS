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

ActiveRecord::Schema.define(version: 2024_01_26_144500) do

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "children", force: :cascade do |t|
    t.integer "cusutomer_id", null: false
    t.string "last_name", null: false
    t.string "first_name", null: false
    t.string "last_name_kana", null: false
    t.string "first_name_kana", null: false
    t.date "date_of_birth", null: false
    t.boolean "male", null: false
    t.decimal "normal_body_temperature"
    t.decimal "fever"
    t.boolean "has_febrile_seizure", null: false
    t.text "febrile_seizure_details"
    t.boolean "has_dislocation", null: false
    t.text "dislocation_details"
    t.boolean "has_allergy", null: false
    t.text "allergy_details"
    t.integer "breastfeeding_status"
    t.integer "breastfeeding_amount"
    t.integer "situation_after_breastfeeding"
    t.integer "milk_situation_after_baby_food"
    t.integer "amount_of_milk_after_baby_food"
    t.integer "baby_food_progress"
    t.integer "appetite"
    t.string "favorite_food"
    t.string "hated_food"
    t.integer "how_to_eat"
    t.integer "meal_time"
    t.integer "how_to_lay_it_down"
    t.integer "falling_asleep"
    t.integer "waking_up"
    t.integer "sleeping_position"
    t.boolean "is_deep_sleep"
    t.string "habits_when_sleeping"
    t.integer "diaper_usage"
    t.boolean "is_sensitive_to_rash"
    t.integer "urination"
    t.integer "defecation"
    t.string "number_of_defecation"
    t.text "favorite_game"
    t.text "favorite_toy"
    t.string "hospital_name"
    t.string "hospital_telephone_number"
    t.text "memo"
    t.boolean "is_active", default: true, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "last_name", null: false
    t.string "first_name", null: false
    t.string "last_name_kana", null: false
    t.string "first_name_kana", null: false
    t.string "postal_code", null: false
    t.string "address", null: false
    t.string "telephone_number", null: false
    t.boolean "is_active", default: true, null: false
    t.text "administrator_notes"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_customers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_customers_on_reset_password_token", unique: true
  end

  create_table "facilities", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name", null: false
    t.string "name_kana", null: false
    t.string "postal_code", null: false
    t.string "address", null: false
    t.string "telephone_number", null: false
    t.string "website", null: false
    t.string "business_day", null: false
    t.string "business_hours", null: false
    t.string "inquiry_hours", null: false
    t.string "closed_day", null: false
    t.string "childcare_hours", null: false
    t.string "target_age", null: false
    t.string "school_meal", null: false
    t.string "fee", null: false
    t.text "message", null: false
    t.boolean "is_active", default: true, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_facilities_on_email", unique: true
    t.index ["reset_password_token"], name: "index_facilities_on_reset_password_token", unique: true
  end

  create_table "families", force: :cascade do |t|
    t.integer "cusutomer_id", null: false
    t.string "last_name", null: false
    t.string "first_name", null: false
    t.string "last_name_kana", null: false
    t.string "first_name_kana", null: false
    t.boolean "male", null: false
    t.integer "relationship", null: false
    t.date "date_of_birth", null: false
    t.string "telephone_number", null: false
    t.string "workplace"
    t.string "workplace_telephone_number"
    t.boolean "is_active", default: true, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "family_reservations", force: :cascade do |t|
    t.integer "family_id", null: false
    t.integer "reservation_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "menus", force: :cascade do |t|
    t.date "date", null: false
    t.text "school_lunch"
    t.string "snack"
    t.text "ingredient", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "relationships", force: :cascade do |t|
    t.integer "follower_id", null: false
    t.integer "followed_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "reservation_conditions", force: :cascade do |t|
    t.date "unavailable_days"
    t.time "unavailable_times"
    t.integer "maximum_number_of_people"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "reservations", force: :cascade do |t|
    t.integer "cusutomer_id", null: false
    t.integer "child_id", null: false
    t.integer "facility_id", null: false
    t.integer "menu_id", null: false
    t.date "date", null: false
    t.time "time", null: false
    t.boolean "wants_meal_service", null: false
    t.integer "purpose_of_use", null: false
    t.boolean "is_valid_reservation", default: true, null: false
    t.boolean "is_allergy_checked", default: true, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
