class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|

      t.integer "customer_id", null: false
      t.integer "child_id", null: false
      t.integer "facility_id", null: false
      t.integer "menu_id", null: true #menu_idはnullで入る場合があるためtrue
      t.date "day", null: false
      t.datetime "start_time", null: false
      t.datetime "end_time", null: false
      t.boolean "wants_meal_service", null: false
      t.integer "purpose_of_use", null: false
      t.boolean "is_valid_reservation", null: false, default: "TRUE"
      t.boolean "is_allergy_checked", null: false, default: "TRUE"
      t.timestamps
    end
  end
end
