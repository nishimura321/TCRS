class CreateFamilyReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :family_reservations do |t|

      t.integer "family_id", null: false
      t.integer "reservation_id", null: false
      t.timestamps
    end
  end
end
