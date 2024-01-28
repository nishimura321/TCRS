class CreateChildren < ActiveRecord::Migration[6.1]
  def change
    create_table :children do |t|

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
      t.integer "situation_after _breastfeeding"
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
      t.timestamps
    end
  end
end
