class CreateReservationConditions < ActiveRecord::Migration[6.1]
  def change
    create_table :reservation_conditions do |t|

      t.timestamps
    end
  end
end
