class CreateReservationConditions < ActiveRecord::Migration[6.1]
  def change
    create_table :reservation_conditions do |t|

      t.date "unavailable_days"
      t.time "unavailable_times"
      t.integer "maximum_number_of_people"
      t.timestamps
    end
  end
end
