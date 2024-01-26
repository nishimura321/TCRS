class CreateFamilyReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :family_reservations do |t|

      t.timestamps
    end
  end
end
