class ChangeFamilyIdToNullableInReservations < ActiveRecord::Migration[6.1]
  def change
    change_column :reservations, :family_id, :integer, null: true
  end
end
