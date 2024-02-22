class CreateFacilitiesMenus < ActiveRecord::Migration[6.1]
  def change
    create_table :facilities_menus do |t|

      t.integer "facility_id", null: false
      t.integer "menu_id", null: false
      t.timestamps
    end
  end
end
