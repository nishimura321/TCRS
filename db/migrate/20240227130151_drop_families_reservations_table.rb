class DropFamiliesReservationsTable < ActiveRecord::Migration[6.1]
  def change
    drop_table :families_reservations
  end
end
